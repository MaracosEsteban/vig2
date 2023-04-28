package com.example.prueba.data

import com.example.prueba.model.Estudiante

class DataSource() {
    fun cargarEstudiantes():MutableList<Estudiante>{
        return mutableListOf<Estudiante>(
            Estudiante("Jose Perez","España","Alicante"),
            Estudiante("Miguel Venito","España","La Rioja"),
            Estudiante("Marcelo Cuello","España","Cáceres"),
            Estudiante("Adrian Manacero","España","Alicante"),
            Estudiante("Francisco Cabrera","Alemania","Frankfurd"),
            Estudiante("Mariano Cuadrado","Argentina","Rafaela"),
            Estudiante("Marcelo Cuello","España","Madrid"),
            Estudiante("Mariano Rajoy","Noruega","Oslo"),
            Estudiante("Francisco Menem","Argentina","San Rafael")
        )
    }
}