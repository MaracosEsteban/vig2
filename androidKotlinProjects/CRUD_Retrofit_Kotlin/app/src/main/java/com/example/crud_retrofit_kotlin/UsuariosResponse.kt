package com.example.crud_retrofit_kotlin

import  com.google.gson.annotations.SerializedName

data class UsuariosResponse (
    @SerializedName("listaUsuarios") var listaUsuarios: ArrayList<Usuario>
        )

