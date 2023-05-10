package com.example.marsphotos.network

import kotlinx.serialization.SerialName
import kotlinx.serialization.Serializable


//@SerialName se usa para nombrar variables en la clase de deatos que difiereon de los nombres de clave

@Serializable
data class MarsPhoto(
    val id: String, @SerialName(value = "img_src")
    val imgSrc: String
)
