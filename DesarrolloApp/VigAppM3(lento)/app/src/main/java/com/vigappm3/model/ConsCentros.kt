package com.vigappm3.model

import kotlinx.serialization.Serializable


/**
 *  Esta información define a lo que se recibe cuando consulto usuarios, la lista de usario mas los campos ok y mensaje
 */
@Serializable
data class ConsCentros(val ok:Boolean,val mensaje:String,val centros:List<Centro>)
