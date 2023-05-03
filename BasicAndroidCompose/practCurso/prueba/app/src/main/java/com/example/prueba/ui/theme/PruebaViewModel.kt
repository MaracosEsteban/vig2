package com.example.prueba.ui.theme

import androidx.compose.runtime.getValue
import androidx.compose.runtime.mutableStateOf
import androidx.compose.runtime.setValue
import androidx.lifecycle.ViewModel
import kotlinx.coroutines.flow.MutableStateFlow
import kotlinx.coroutines.flow.StateFlow
import kotlinx.coroutines.flow.asStateFlow
import kotlinx.coroutines.flow.update


class PruebaViewModel : ViewModel() {

    // Game UI state
    private val _uiState = MutableStateFlow(PruebaUiState())
    val uiState: StateFlow<PruebaUiState> = _uiState.asStateFlow()

    //guardo la pantalla anterior para poder volver desde donde vine
    var pantAnterior: Int = _uiState.value.currentScreen


    var nameEntry by mutableStateOf("")
        private set // the setter is private and has the default implementation, pero el geter es público


    var passEntry by mutableStateOf("")
        private set // the setter is private and has the default implementation, pero el geter es público


    fun CambiarPantalla(pant: Int) {
        pantAnterior = _uiState.value.currentScreen
        _uiState.value = PruebaUiState(pant)
    }

    fun VolverPantAnterior() {
        _uiState.value.currentScreen = pantAnterior
    }


    fun actulizarNameEntry(name: String) {
        nameEntry = name
    }


    fun actulizarPassEntry(pass: String) {
        passEntry = pass
    }

    fun BorrrNyP() {
        nameEntry = ""
        passEntry = ""
    }


    fun ChecquearDatos():Boolean {

        return  if (nameEntry == "Marcos" && passEntry == "1234") {
            true

        } else {
            _uiState.update { currentState ->
                currentState.copy(userDataWrong = true)



            }
            false

        }


    }
}