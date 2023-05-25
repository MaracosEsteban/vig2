package com.vigappm3.model


import kotlinx.serialization.Serializable

/**
 *  Esta información define a una lectura
 */


@Serializable
data class Lectura(val ID:Long,val FHLOCAL:String,val LATITUD:String,val LONGITUD:String,val USUARIO_ID: Int, val CENTRO_ID:Int,val OBSERVACION:String )








//
//
//`ID` bigint(15)  PRIMARY KEY AUTO_INCREMENT,
//`FHLOCAL` DATETIME NULL DEFAULT NULL,
//`LATITUD` VARCHAR(20) NULL DEFAULT NULL COLLATE 'utf8_general_ci',
//`LONGITUD` VARCHAR(20) NULL DEFAULT NULL COLLATE 'utf8_general_ci',
//`USUARIO_ID` INT(10),
//`CENTRO_ID` INT(10) ,
