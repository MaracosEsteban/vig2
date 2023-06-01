package com.vigappm3.varios

import java.text.SimpleDateFormat
import java.time.LocalDateTime
import java.time.format.DateTimeFormatter




/*
https://www.youtube.com/watch?v=gzHy6wKAJh8&t=23s
The Full Guide About the DateTime API in Kotlin
 */



fun cambiarFormatoFecha( dateStringInput: String = "0001-01-01 00:00:00"):String {
    var dateStringOutput ="1 enero 0001, 00:00"
    val formatter2 = DateTimeFormatter.ofPattern("yyyy-MM-dd HH:mm:ss") // => formato de entrada
    val formatter1 = DateTimeFormatter.ofPattern("d MMMM yyyy, HH:mm")  // => formato de salida
    try {
        val auxDate = LocalDateTime.parse(dateStringInput, formatter2)
        dateStringOutput=auxDate.format(formatter1).toString()

        LocalDateTime.of(1,1,1,1,1,1)
    } catch (e:Exception){
        //No hace nada devuelve la fecha por defecto
    }
    return dateStringOutput
}



