package com.vigappm3.ui

import com.vigappm3.model.Centro


data class AppUiState(
    var listaCentros: MutableList<Centro> = mutableListOf<Centro>(),
    var centroSelec: Centro=Centro()


// revisar
//    val nombreCentro:String="",
//    val IdCentro:Int=0
//    val idUsuario:String="",
//    val nombreUsuario:String="",
//    val emailUsuario:String="",
)

