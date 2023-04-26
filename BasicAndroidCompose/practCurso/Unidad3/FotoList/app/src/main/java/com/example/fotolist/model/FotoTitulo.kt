package com.example.fotolist.model

import androidx.annotation.DrawableRes
import androidx.annotation.StringRes

data class FotoTitulo(
    @StringRes
    val tituloResource: Int,
    @DrawableRes
    val imageResourceId: Int
)