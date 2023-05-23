package com.vigappm3.ui

import androidx.compose.runtime.getValue
import androidx.compose.runtime.mutableStateOf
import androidx.compose.runtime.setValue
import androidx.lifecycle.ViewModel
import androidx.lifecycle.viewModelScope
import com.vigappm3.network.VigApi
import kotlinx.coroutines.flow.MutableStateFlow
import kotlinx.coroutines.flow.StateFlow
import kotlinx.coroutines.flow.asStateFlow
import kotlinx.coroutines.launch
import retrofit2.HttpException
import java.io.IOException
import com.vigappm3.model.*
import kotlinx.coroutines.flow.update


/**
 * UI state for the Home screen
 */


//sealed interface ReadingState {
//    data class Success(val usuarios: Usuario) : ReadingState
//    object Error : ReadingState
//    object Loading : ReadingState
//}


class VigAppViewModel : ViewModel() {

    lateinit var listaResultados: List<Usuario>


    private val _uiState = MutableStateFlow(AppUiState())
    val uiState: StateFlow<AppUiState> = _uiState.asStateFlow()


    var enteredName by mutableStateOf("")
        private set
    var enteredPassword by mutableStateOf("")
        private set


    var nombreLeido: String = ""
    var claveLeida: String = ""
    var ok: Boolean = false
    var mensaje: String = ""
    var idUsuarios: Int = -1
    var idCentros: Int = -1


    init {
        //getListaUsuarios()
        // getConsUsuarios()
        //getConsCentros()
        getListaCentrosToUiState()
    }


    fun updateEnteredName(nameEntered: String) {
        this.enteredName = nameEntered
    }


    fun updateEnteredPass(passwordEntered: String) {
        this.enteredPassword = passwordEntered
    }


    fun login(): Boolean {
        //https://www.youtube.com/watch?v=KqLtW8d8PXY
        getConsUsuarios()
        var result = if (ok) {
            enteredPassword.equals(claveLeida)
        } else {
            false
        }
        return result
    }

    /**
     *  Elimina toda la información referete a un usuario incluhida la informacin en pantalla
     */
    fun logout() {
        enteredName = ""
        enteredPassword = ""
        nombreLeido = ""
        claveLeida = ""
        ok = false
        mensaje = ""
        idUsuarios = -1
        idCentros = -1

    }

    fun getConsUsuarios() {
        viewModelScope.launch {
            try {
                var resp = VigApi.retrofitService.getUsuario(enteredName)
                nombreLeido = resp[0].usuarios[0].NOMBRE
                claveLeida = resp[0].usuarios[0].CLAVE
                idCentros = resp[0].usuarios[0].ID
                ok = resp[0].ok
                mensaje = resp[0].mensaje
                updateEnteredName(resp[0].usuarios[0].NOMBRE)
            } catch (e: IOException) {
                ok = false
                mensaje = "IO Exception"
            } catch (e: HttpException) {
                ok = false
                mensaje = "Http Exception"
            }
        }

    }


    fun getListaCentrosToUiState() {
        // todo hay que guardar el   idCentros
        // todo no estoy teniendo en cuenta erores

        var lista = listOf<Centro>()

        viewModelScope.launch {
            try {
                var res = VigApi.retrofitService.getCenros()[0].centros
//                updateEnteredName(
//                    res.count().toString()
//                )
                lista=res

                // todo   Uso las mismas variables?
//                ok = res[0].ok
//                mensaje = res[0].mensaje
       //         lista=res[0].usuarios.toMutableList()
            } catch (e: IOException) {
                ok = false
                mensaje = "IO Exception"
            } catch (e: HttpException) {
                ok = false
                mensaje = "Http Exception"
            }
        }
        _uiState.update { currentState ->
            currentState.copy(listaCentros = lista)

        }
        //todo  Aqui no llega la lista de centros
        updateEnteredName(this.uiState.value.listaCentros.count().toString())
    }
}






