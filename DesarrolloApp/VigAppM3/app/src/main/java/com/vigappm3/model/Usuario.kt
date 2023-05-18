package com.vigappm3.model

import kotlinx.serialization.Serializable

/**
 *  Esta información define a un usuario, incluye id, nombre, clave y email
 */

@Serializable
data class Usuario(
    val id: Int, val nombre: String, val clave: String, val email: String
)

//@Serializable
//data class Response(
//
//    val listaUsuarios: List<Usuario>
//)


