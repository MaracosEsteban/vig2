package com.example.fotolist.data

import com.example.fotolist.R
import com.example.fotolist.model.FotoTitulo

class DataSource() {

    fun loadFotoTitulos():List<FotoTitulo>{
        return listOf<FotoTitulo>(
            FotoTitulo(R.string.descripcion_foto_1, R.drawable._0230320_173940),
            FotoTitulo(R.string.descripcion_foto_2, R.drawable._0230321_081633),
            FotoTitulo(R.string.descripcion_foto_3, R.drawable._0230322_181319),
            FotoTitulo(R.string.descripcion_foto_4, R.drawable._0230322_181327),
            FotoTitulo(R.string.descripcion_foto_5, R.drawable._0230326_170626),
            FotoTitulo(R.string.descripcion_foto_6, R.drawable._0230326_170911),
            FotoTitulo(R.string.descripcion_foto_7, R.drawable._0230326_171139),
            FotoTitulo(R.string.descripcion_foto_8, R.drawable._0230331_153948),
            FotoTitulo(R.string.descripcion_foto_9, R.drawable._0230416_130624),
            FotoTitulo(R.string.descripcion_foto_10, R.drawable._0230416_130910),
            FotoTitulo(R.string.descripcion_foto_11, R.drawable._0230416_130941),
            FotoTitulo(R.string.descripcion_foto_12, R.drawable._0230416_131120),
        )
    }





}