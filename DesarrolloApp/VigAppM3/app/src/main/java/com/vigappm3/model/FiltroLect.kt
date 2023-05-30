package com.vigappm3.model

import kotlinx.serialization.Serializable


/**
 * Esta clase representa lod datos para aplicar el filtro a lecturas
 *
 */


@Serializable
data class FiltroLect(var ID_USUARIO:String="",var FECHA_DESDE:String="" ,var FECHA_HASTA:String="")
