package com.vigappm3.ui



import androidx.compose.runtime.getValue
import androidx.compose.runtime.mutableStateOf
import androidx.compose.runtime.setValue
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




    var enteredName by mutableStateOf("")
        private set
    var enteredPassword by mutableStateOf("")
        private set



    fun updateEnteredName(enteredName: String){
        this.enteredName = enteredName
    }

    fun updateEnteredPass(enteredPasword: String){
        this.enteredPassword= enteredPassword
    }





    fun login(){
        // conectarme a la BBDD y ver si considen nombre y passs....


    }



    fun logout() {
        // poner a cero todas las variables que representan  al trabajador y al cantro........
    }



}

















