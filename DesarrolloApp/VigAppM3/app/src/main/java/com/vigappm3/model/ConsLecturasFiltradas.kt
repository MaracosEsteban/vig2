package com.vigappm3.model

import kotlinx.serialization.Serializable

@Serializable
data class ConsLecturasFiltradas(val ok:Boolean,val mensaje:String,val centros:List<LecturasFiltradas>)
