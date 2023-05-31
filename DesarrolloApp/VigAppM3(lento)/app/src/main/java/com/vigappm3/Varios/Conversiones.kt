package com.vigappm3.Varios

import java.time.LocalDateTime
import java.time.format.DateTimeFormatter


//
//fun cambiarFormatoFecha( dateStringInput: String = "0001-01-01 00:00:00"):String {
//    var dateStringOutput ="1 enero 0001, 00:00"
//    val formatter2 = DateTimeFormatter.ofPattern("yyyy-MM-dd HH:mm:ss") // => formato de entrada
//    val formatter1 = DateTimeFormatter.ofPattern("d MMMM yyyy, HH:mm")  // => formato de salida
//    try {
//        val auxDate = LocalDateTime.parse(dateStringInput, formatter2)
//        dateStringOutput=auxDate.format(formatter1).toString()
//    } catch (e:Exception){
//        //No hace nada devuelve la fecha por defecto
//    }
//    return dateStringOutput
//}