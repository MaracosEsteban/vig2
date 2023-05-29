package com.vigappm3.model

import kotlinx.serialization.Serializable

/**
 *  Esta información define a un centro
 */

@Serializable
data class Centro(
    val ID: Int=-1,
    val NOMBRE: String="",
    val EMAIL: String="",
    val PASS: String="",
    val CIF: String="",
    val PAIS: String="",
    val CIUDAD: String="",
    val DIRECCION: String="",
    val COD_POSTAL:String="",
    val TEL: String="",
)

