package com.example.total

import androidx.lifecycle.ViewModel
import kotlinx.coroutines.flow.MutableStateFlow
import kotlinx.coroutines.flow.StateFlow
import kotlinx.coroutines.flow.asStateFlow




class MyViewModel: ViewModel() {


    // Game UI state
    private val _uiState = MutableStateFlow(Estado())
    // Backing property to avoid state updates from other classes
    val uiState: StateFlow<Estado> = _uiState.asStateFlow()

    var total =0


    fun sumar(monto:Int){
        total += monto
    }

    fun resetear(){
        total=0
    }

}