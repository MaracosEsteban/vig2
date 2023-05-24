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


class VigAppViewModel : ViewModel() {

    private val _uiState = MutableStateFlow(AppUiState())
    val uiState: StateFlow<AppUiState> = _uiState.asStateFlow()

    var enteredName by mutableStateOf("")
        private set
    var enteredPassword by mutableStateOf("")
        private set

    //para guardar los datos del usuario logeado
    var usuarioActual: Usuario = Usuario()
    var okUsuario: Boolean = false
    var mensajeUsuario: String = ""

    //para guardar los dato del centro en uso
    var centroActual: Centro = Centro()

    // para saber si la lectura de los centros fué exitosa
    var okCentros: Boolean = false
    var mensajeCentros: String = ""


    init {
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


    fun login(): Boolean {
        //https://www.youtube.com/watch?v=KqLtW8d8PXY
        //todo solucionar  que hay que precionar dos veces login
        getConsUsuarios()
        var result = if (okUsuario) {
            enteredPassword.equals(usuarioActual.CLAVE)
        } else {
            false
        }
        return result
    }

    /**
     *  Elimina toda la información de la sesion usuario, centro , datos en pantalla
     */
    fun logout() {
        enteredName = ""
        enteredPassword = ""

        usuarioActual = Usuario()
        okUsuario = false
        mensajeUsuario = ""

        actualizarCentro(Centro())


        okCentros = false
        mensajeCentros = ""
    }


    fun actualizarCentro(centroActual:Centro){
        _uiState.update { currentState ->
            currentState.copy(centroSelec = centroActual)
        }
    }






    //------------------------ Los cuatro servicios para acceder a  la BBDD


    fun getConsUsuarios() {
        viewModelScope.launch {
            try {
                var resp = VigApi.retrofitService.getUsuario(enteredName)
                usuarioActual = resp[0].usuarios[0]
                okUsuario = resp[0].ok
                mensajeUsuario = resp[0].mensaje
            } catch (e: IOException) {
                okUsuario = false
                mensajeUsuario = "IO Exception"
            } catch (e: HttpException) {
                okUsuario = false
                mensajeUsuario = "Http Exception"
            }
        }
    }


    /**
     *
     * todo recordar guardar el id del centro seleccionado
     * todo la consulta me devuelve error pero no la estoy usuando
     *
     */
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




}







