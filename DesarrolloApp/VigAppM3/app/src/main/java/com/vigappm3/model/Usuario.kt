package com.vigappm3.model

import kotlinx.serialization.Serializable

/**
 *  Esta información define a un usuario, incluye id, nombre, clave y email
 */

@Serializable
data class Usuario(
    val ID: Int=-1, val NOMBRE: String="", val CLAVE: String="", val EMAIL: String=""
)


