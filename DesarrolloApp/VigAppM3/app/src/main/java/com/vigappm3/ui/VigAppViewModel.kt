package com.vigappm3.ui

import android.app.PendingIntent.getActivity
import android.widget.Toast
import androidx.compose.runtime.getValue
import androidx.compose.runtime.mutableStateOf
import androidx.compose.runtime.setValue
import androidx.compose.ui.platform.LocalDensity
import androidx.lifecycle.ViewModel
import androidx.lifecycle.viewModelScope
import androidx.navigation.NavHostController
import com.vigappm3.VigAppScreen
import com.vigappm3.model.Centro
import com.vigappm3.model.ConsLecturasFiltradas
import com.vigappm3.model.ConsUsuarios

import com.vigappm3.model.GuardarLecturas
import com.vigappm3.model.Lectura
import com.vigappm3.model.Usuario
import com.vigappm3.network.VigApi
import kotlinx.coroutines.flow.MutableStateFlow
import kotlinx.coroutines.flow.StateFlow
import kotlinx.coroutines.flow.asStateFlow
import kotlinx.coroutines.flow.update
import kotlinx.coroutines.launch
import retrofit2.HttpException
import java.io.IOException
import java.time.LocalDate
import java.time.format.DateTimeFormatter
import kotlin.properties.Delegates


class VigAppViewModel : ViewModel() {

    private val _uiState = MutableStateFlow(AppUiState())
    val uiState: StateFlow<AppUiState> = _uiState.asStateFlow()

    var enteredName by mutableStateOf("")
        private set
    var enteredPassword by mutableStateOf("")
        private set

    var observaciones by mutableStateOf("")
        private set




    // para saber si la lectura de los centros fué exitosa
    var okCentros: Boolean = false
    var mensajeCentros: String = ""


    // -------------------------VARIABLES DE ESTADO DE LOS SERVICIOS--------------------------------------------------------
    var guardarLecturasState: GuardarLecturasState by mutableStateOf(GuardarLecturasState.Saving)
        private set
    var getLecturasFiltradasState: GetLecturasFiltradasState by mutableStateOf(GetLecturasFiltradasState.Recuperando)
        private set

    var getUsuarioState: GetUsuarioState by mutableStateOf(GetUsuarioState.Reading)
        private set






    val formatoFecha = DateTimeFormatter.ofPattern("dd-MM-yyyy")// se repite endiferentes pares del proyecto

    var fechaDesde:String by mutableStateOf(LocalDate.now().format(formatoFecha).toString())

    var fechaHasta:String by mutableStateOf(LocalDate.now().format(formatoFecha).toString())








    init {
        //recuperaLecturasFiltradas()
    }

    fun updateEnteredName(nameEntered: String) {
        this.enteredName = nameEntered
    }

    fun updateEnteredPass(passwordEntered: String) {
        this.enteredPassword = passwordEntered
    }

    fun updateObserv(obser: String) {
        this.observaciones = obser
    }


    fun updateFechaDesde(fecha: String) {
        this.fechaDesde = fecha
        println("se actualizo la afecha a  $fecha")
    }


    fun updateFechaHasta(fecha: String) {
        this.fechaHasta = fecha
    }







    fun login() {
    }


    /**
     *  Elimina toda la información de la sesion usuario, centro , datos en pantalla
     */
    fun logout() {
        enteredName = ""
        enteredPassword = ""


        actualizarCentro(Centro())


        okCentros = false
        mensajeCentros = ""
    }


    fun actualizarCentro(centroActual: Centro) {
        _uiState.update { currentState ->
            currentState.copy(centroSelec = centroActual)
        }
    }


    //-----------------------------------------------------------------------------------------------------------------------------------------------
    //------------------------ LOS CUATRO SERVICIOS PARA ACCEDER A AL BASE DE DATOS CON SUS RESPECTIVAS INERFACES -----------------------------------
    //-----------------------------------------------------------------------------------------------------------------------------------------------


    // S1 interface + variable + servicioGuradarlecturas

    sealed interface GetUsuarioState {
        data class Success(val consUsuarios: List<ConsUsuarios>) : GetUsuarioState
        data class Error(val mensaje: String) : GetUsuarioState
        object Reading : GetUsuarioState
    }


//    var getUsuarioState: GetUsuarioState by mutableStateOf(GetUsuarioState.Reading)
//        private set


    fun getConsUsuarios(navHostController: NavHostController) {

         getUsuarioState = GetUsuarioState.Reading
        //fuente  =>  https://stackoverflow.com/questions/54313839/how-to-set-up-a-listener-for-a-variable-in-kotlin
        var consUsuario: ConsUsuarios = ConsUsuarios(false, "Error Conexion", listOf(Usuario()))


        var flagFinised by Delegates.observable(false) { property, oldValue, newValue ->
            if (newValue && (consUsuario.ok)) {
                if (consUsuario.usuarios[0].CLAVE == enteredPassword) {

                   updateEnteredName("La clave coinside")
                    navHostController.navigate(VigAppScreen.Menu.name)
                } else {
                    updateEnteredName("Clave no coinside con el usuario")

                                   }
            } else {
                if (consUsuario.mensaje == "Error Conexion") {
                    updateEnteredName("Error Conexión")
                } else if (consUsuario.mensaje == "No hay registros") {
                    updateEnteredName("No hay usuarios con ese nombre")
                }
            }
        }


        viewModelScope.launch {
            // getUsuarioState =
            try {
                var consultas = VigApi.retrofitService.getUsuario(enteredName)
                consUsuario = consultas[0]
                getUsuarioState = GetUsuarioState.Success(consultas)

            } catch (e: IOException) {
                GetUsuarioState.Error("IOException")
            } catch (e: HttpException) {
                flagFinised = false
                GetUsuarioState.Error("HttpException")
            } finally {
                flagFinised =
                    true  //La bandera indica que ya pasó por el try catch independientemente del resultado
            }
        }
    }




    // S2 interface + variable + servicioGuradarlecturas


    fun getListaCentrosToUiState() {
        var lista = mutableListOf<Centro>()
        viewModelScope.launch {
            try {
                var res = VigApi.retrofitService.getCenros()[0].centros
                lista = res.toMutableList()
                _uiState.update { currentState ->
                    currentState.copy(listaCentros = lista)
                }
            } catch (e: IOException) {
                okCentros = false
                mensajeCentros = "IO Exception"
            } catch (e: HttpException) {
                okCentros = false
                mensajeCentros = "Http Exception"
            }
        }
    }


    // S3 interface + variable + servicioGuradarlecturas
    sealed interface GuardarLecturasState {
        data class Success(val resp: List<GuardarLecturas>) : GuardarLecturasState
        data class Error(val mensaje: String) : GuardarLecturasState
        object Saving : GuardarLecturasState
    }

//    var guardarLecturasState: GuardarLecturasState by mutableStateOf(GuardarLecturasState.Saving)
//        private set

    fun guardarLecturas() {
        var user_id = if (getUsuarioState is GetUsuarioState.Success) {
            (getUsuarioState as GetUsuarioState.Success).consUsuarios[0].usuarios[0].ID
        } else {
            -1
        }

        guardarLecturasState = GuardarLecturasState.Saving
        var lect = listOf<Lectura>(
            Lectura(
                ID = -1,
                FHLOCAL = "",
                LATITUD = "LATITUD",
                LONGITUD = "LONGITUD",
                USUARIO_ID = user_id,
                CENTRO_ID = uiState.value.centroSelec.ID,
                OBSERVACION = this.observaciones
            )
        )
        viewModelScope.launch {
            guardarLecturasState = try {
                // var guardarLecturasStat = VigApi.retrofitService.crearLectura(listita)
                GuardarLecturasState.Success(VigApi.retrofitService.crearLectura(lect))
            } catch (e: IOException) {
                GuardarLecturasState.Error("IOException")
            } catch (e: HttpException) {
                GuardarLecturasState.Error("HttpException")
            }
        }
    }


    // S4 interface + variable + servicioGuradarlecturas
    sealed interface GetLecturasFiltradasState {
        data class Success(val resp: List<ConsLecturasFiltradas>) : GetLecturasFiltradasState
        data class Error(val mensaje: String) : GetLecturasFiltradasState
        object Recuperando : GetLecturasFiltradasState
    }




    fun recuperaLecturasFiltradas() {
        var user_id = if (getUsuarioState is GetUsuarioState.Success) {
            (getUsuarioState as GetUsuarioState.Success).consUsuarios[0].usuarios[0].ID
        } else {
            -1
        }
        getLecturasFiltradasState = GetLecturasFiltradasState.Recuperando
        viewModelScope.launch {
            getLecturasFiltradasState = try {
                GetLecturasFiltradasState.Success(VigApi.retrofitService.getLecturas(user_id.toString(),"2020-05-15","2030-05-15"))
            } catch (e: IOException) {
                GetLecturasFiltradasState.Error("IOException")
            } catch (e: HttpException) {
                GetLecturasFiltradasState.Error("HttpException")
            }
        }
    }
}












