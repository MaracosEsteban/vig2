package com.example.marsphotos.data

/**
    En general, en una clase de repositorio hace lo siguiente:

    Expone datos al resto de la app.
    Centraliza los cambios en los datos.
    Resuelve los conflictos entre varias fuentes de datos.
    Abstrae las fuentes de datos del resto de la app.
    Contiene la lógica empresarial.
 *
 */


import com.example.marsphotos.model.MarsPhoto
//import com.example.marsphotos.network.MarsApi
import com.example.marsphotos.network.MarsApiService

interface MarsPhotosRepository {
    suspend fun getMarsPhotos(): List<MarsPhoto>  // se llama desde una corrutina por lo que debe declararse con suspend
}




class DefaultMarsPhotosRepository(private val marsApiService: MarsApiService):MarsPhotosRepository{
    override suspend fun getMarsPhotos(): List<MarsPhoto> {
        return  marsApiService.getPhotos()
    }
}

