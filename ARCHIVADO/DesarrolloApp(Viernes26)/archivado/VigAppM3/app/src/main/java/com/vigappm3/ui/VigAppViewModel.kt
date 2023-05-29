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


    var nombreLeido: String=""
    var claveLeida: String =""
    var ok:Boolean= false
    var mensaje:String=""






    init {
        //getListaUsuarios()
        getConsUsuarios()
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




        return enteredPassword.equals(claveLeida) && !enteredPassword.equals("")


    }

    /**
     *  Pone a cero todas la varibles que utilizo para realizar el login
     */
    fun logout() {
        // "Poner a cero"" todas las variable que se utilizan para realizar le login
        enteredName = ""
        enteredPassword = ""
        nombreLeido = ""
        claveLeida = ""
        ok=false
        mensaje=""
    }


    fun getConsUsuarios() {
        viewModelScope.launch {
            try {
                var res = VigApi.retrofitService.getUsuario(enteredName)
                nombreLeido = res[0].usuarios[0].NOMBRE
                claveLeida = res[0].usuarios[0].CLAVE
                ok=res[0].ok
                mensaje=res[0].mensaje

            } catch (e: IOException) {
                ok=false
                mensaje="IO Exception"
            } catch (e: HttpException) {
                ok=false
                mensaje="Http Exception"
            }
        }

    }
}






