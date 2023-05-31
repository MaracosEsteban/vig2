package com.vigappm3.model

import kotlinx.serialization.Serializable

/**
 * Esta clase representa una fila de la consulta cuando se filtran
 * las lecturs por un id de usuario e intervalo de fechas
 * */


@Serializable
data class LecturasFiltradas(
    val NOMBRE_CENTRO: String="", val FHLOCAL: String="", val OBSERVACION: String="", val LATITUD: String="", val LONGITUD: String=""
)




