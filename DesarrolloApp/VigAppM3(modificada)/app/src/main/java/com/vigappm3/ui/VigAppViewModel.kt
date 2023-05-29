package com.vigappm3.ui

import android.content.ContentValues.TAG
import android.util.Log
import androidx.compose.runtime.getValue
import androidx.compose.runtime.mutableStateOf
import androidx.compose.runtime.setValue
import androidx.lifecycle.ViewModel
import androidx.lifecycle.viewModelScope
import androidx.navigation.NavHostController
import com.vigappm3.VigAppScreen
import com.vigappm3.network.VigApi
import kotlinx.coroutines.flow.MutableStateFlow
import kotlinx.coroutines.flow.StateFlow
import kotlinx.coroutines.flow.asStateFlow
import kotlinx.coroutines.launch
import retrofit2.HttpException
import java.io.IOException
import com.vigappm3.model.*
import kotlinx.coroutines.flow.update
import kotlinx.coroutines.runBlocking
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

//    //para guardar los datos del usuario logeado
//    var usuarioActual: Usuario = Usuario()
//    var okUsuario: Boolean = false
//    var mensajeUsuario: String = ""

    //para guardar los dato del centro en uso
    var centroActual: Centro = Centro()

    // para saber si la lectura de los centros fué exitosa
    var okCentros: Boolean = false
    var mensajeCentros: String = ""
    var contador = 1


    init {
        contador = 1

        //getListaUsuarios()
        // getConsUsuarios()
        //getConsCentros()
        //getListaCentrosToUiState()
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


    fun login(): Boolean {
        var result = false
//        //https://www.youtube.com/watch?v=KqLtW8d8PXY
//        //todo solucionar  que hay que precionar dos veces login
//
//
//        private var myVariableName by Delegates.observable(0) { property, oldValue, newValue ->
//            Log.d(TAG,"New Value $newValue")
//            Log.d(TAG,"Old Value $oldValue")
//        }
//
//
//
//
//        if (getUsuarioState is GetUsuarioState.Success) {
//            result =
//                ((getUsuarioState as GetUsuarioState.Success).consUsuarios[0].ok) && ((getUsuarioState as GetUsuarioState.Success).consUsuarios[0].usuarios[0].CLAVE.equals(
//                    enteredPassword
//                ))
//        }
//
//
////        if (getUsuarioState is GetUsuarioState.Success){
////            updateEnteredName("Terminado")
////
////        }else
////        {updateEnteredName("no terminado")}
//
//
//        //esperar hasta que la consulta este hecha
//
//
////         if (getUsuarioState is GetUsuarioState.Success) {
////            var ok = (getUsuarioState as GetUsuarioState.Success).consUsuarios[0].ok
////             result= ok && ((getUsuarioState as GetUsuarioState.Success).consUsuarios[0].usuarios[0].CLAVE.equals(centroActual))
////        }
//
//
////        var result = if (okUsuario) {
////            enteredPassword.equals(usuarioActual.CLAVE)
////        } else {
////            false
////        }
        return result


    }


    /**
     *  Elimina toda la información de la sesion usuario, centro , datos en pantalla
     */
    fun logout() {
        enteredName = ""
        enteredPassword = ""

//        usuarioActual = Usuario()
//        okUsuario = false
//        mensajeUsuario = ""

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
    //------------------------ LOS CUATRO SERVICIOS PARA ACCEDER A AL BASE DE DATOS CON SUS RESPECTIVAS INERFACES Y VARIABLES DE ESTADO -------------
    //-----------------------------------------------------------------------------------------------------------------------------------------------


    // S1 interface + variable + servicioGuradarlecturas

    sealed interface GetUsuarioState {
        data class Success(val consUsuarios: List<ConsUsuarios>) : GetUsuarioState
        data class Error(val mensaje: String) : GetUsuarioState
        object Reading : GetUsuarioState
    }

    var getUsuarioState: GetUsuarioState by mutableStateOf(GetUsuarioState.Reading)
        private set


    fun getConsUsuarios(navHostController: NavHostController) {
        getUsuarioState = GetUsuarioState.Reading
        //fuente  =>  https://stackoverflow.com/questions/54313839/how-to-set-up-a-listener-for-a-variable-in-kotlin
        var consUsuario: ConsUsuarios = ConsUsuarios(false, "Error Conexion", listOf(Usuario()))
        var flagFinised by Delegates.observable(false) { property, oldValue, newValue ->


            if (newValue && (consUsuario.ok)) {




                if(consUsuario.usuarios[0].CLAVE==enteredPassword){
                    updateEnteredName("La clave coinside")
                    navHostController.navigate(VigAppScreen.Menu.name)
                }
                else
                {
                    updateEnteredName("Clave no coinside con el usuario")

                }


            } else {
                if (consUsuario.mensaje == "Error Conexion") {
                    updateEnteredName("Error Conexión")
                } else if (consUsuario.mensaje == "No hay registros") {
                    updateEnteredName("No hay usuarios con ese nombre")
                }


            }


//             if(((getUsuarioState as GetUsuarioState.Success).consUsuarios[0].ok) && ((getUsuarioState as GetUsuarioState.Success).consUsuarios[0].usuarios[0].CLAVE.equals(
//                    enteredPassword
//                ))){  navHostController.navigate(VigAppScreen.Menu.name)  }


        }



        viewModelScope.launch {
            // getUsuarioState =
            try {
                var consultas = VigApi.retrofitService.getUsuario(enteredName)
                consUsuario = consultas[0]
                getUsuarioState = GetUsuarioState.Success(consultas)


//                var resp = VigApi.retrofitService.getUsuario(enteredName)
//                usuarioActual = resp[0].usuarios[0]
//                okUsuario = resp[0].ok
//                mensajeUsuario = resp[0].mensaje


            } catch (e: IOException) {
//                okUsuario = false
//                mensajeUsuario = "IO Exception"
                GetUsuarioState.Error("IOException")
            } catch (e: HttpException) {
                flagFinised = false


//                okUsuario = false
//                mensajeUsuario = "Http Exception"
                GetUsuarioState.Error("HttpException")
            } finally {


                flagFinised =
                    true  //La bandera indica que ya pasó por el try catch independientemente del resultado


            }
        }
    }


    /**
     * todo recordar guardar el id del centro seleccionado
     * todo la consulta me devuelve error pero no la estoy usuando
     */


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

    var guardarLecturasState: GuardarLecturasState by mutableStateOf(GuardarLecturasState.Saving)
        private set

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
                FHLOCAL = "fsdfsd",
                LATITUD = "LATITUD",
                LONGITUD = "LONGITUD",
//                USUARIO_ID = usuarioActual.ID,
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


}







