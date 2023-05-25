package com.vigappm3.model

import kotlinx.serialization.Serializable

/**
 *  Define la informacion necesaria para acceder al servicio que guarda una lectura
 */


@Serializable
data class GuardarLecturasResp(val ok:Boolean,val mensaje:String)



