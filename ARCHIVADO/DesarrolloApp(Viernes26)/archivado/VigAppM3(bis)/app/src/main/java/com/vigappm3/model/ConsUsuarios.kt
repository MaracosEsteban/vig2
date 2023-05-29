package com.vigappm3.model

import kotlinx.serialization.Serializable

/**
 *  Esta información define a lo que recibo cuando consulto usuarios, la lista de usario mas los campos ok y mensaje
 */
@Serializable
data class ConsUsuarios(val ok:Boolean,val mensaje:String,val usuarios:List<Usuario>)
