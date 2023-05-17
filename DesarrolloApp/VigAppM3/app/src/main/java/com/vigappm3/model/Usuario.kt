package com.vigappm3.model

import kotlinx.serialization.SerialName
import kotlinx.serialization.Serializable

/**
 *
 * Esta información define a un usuario, incluye id, nombre, clave y email
 */

@Serializable
data class Usuario( val id:String,


)



//
//
//create table usuarios(
//id int primary key AUTO_INCREMENT,
//nombre varchar(50) not null unique,
//clave varchar(100) not null,
//email varchar(100) not null
//);
