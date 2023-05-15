package com.vigapp.ui



import androidx.lifecycle.ViewModel
//import com.example.lunchtray.model.MenuItem
//import com.example.lunchtray.model.MenuItem.AccompanimentItem
//import com.example.lunchtray.model.MenuItem.EntreeItem
//import com.example.lunchtray.model.MenuItem.SideDishItem
//import com.example.lunchtray.model.OrderUiState
import kotlinx.coroutines.flow.MutableStateFlow
import kotlinx.coroutines.flow.StateFlow
import kotlinx.coroutines.flow.asStateFlow
import kotlinx.coroutines.flow.update
import java.text.NumberFormat

class VigAppViewModel : ViewModel() {



    private val _uiState = MutableStateFlow(AppUiState())
    val uiState: StateFlow<AppUiState> = _uiState.asStateFlow()


    fun login(){
        // conectarme a la BBDD y ver si considen nombre y passs....


    }



    fun logout() {
        // poner a cero todas las variables que representan  al trabajador y al cantro........
    }



}

















