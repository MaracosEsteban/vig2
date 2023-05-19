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
import kotlinx.coroutines.flow.update
import kotlinx.coroutines.launch
import retrofit2.HttpException
import java.io.IOException
import java.text.NumberFormat
import com.vigappm3.model.*



/**
 * UI state for the Home screen
 */
sealed interface ReadingState {
    data class Success(val usuarios: List<Usuario>) : ReadingState
    object Error : ReadingState
    object Loading : ReadingState
}










class VigAppViewModel : ViewModel() {

    lateinit var listaResultados: List<Usuario>


    private val _uiState = MutableStateFlow(AppUiState())
    val uiState: StateFlow<AppUiState> = _uiState.asStateFlow()



    var readingState: ReadingState by mutableStateOf(ReadingState.Loading)
        private set


    var nombreLeido:String  by mutableStateOf("")


    var enteredName by mutableStateOf("")
        private set
    var enteredPassword by mutableStateOf("")
        private set


    init {
        // getListaUsuarios()
    }




    fun updateEnteredName(nameEntered: String){
        this.enteredName = nameEntered
    }

    fun updateEnteredPass(passwordEntered: String){
        this.enteredPassword= passwordEntered
    }




fun login():Boolean{
    getListaUsuarios()
    return enteredName.equals(nombreLeido)



}



    fun logout() {
        // poner a cero todas las variables que representan  al trabajador y al centro........
    }


    private fun getListaUsuarios() {
        viewModelScope.launch {
            readingState = try {
                val listResult = VigApi.retrofitService.getUsuarios()
               // listaResultados =listResult
               // updateEnteredName(listResult[0].NOMBRE)
                nombreLeido=listResult[0].NOMBRE
                ReadingState.Success(listResult)
            } catch (e: IOException) {
                ReadingState.Error
            } catch (e: HttpException) {
                ReadingState.Error
            }
        }
    }










}











