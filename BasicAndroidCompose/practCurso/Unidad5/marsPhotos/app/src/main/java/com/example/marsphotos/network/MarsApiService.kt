package com.example.marsphotos.network

import com.jakewharton.retrofit2.converter.kotlinx.serialization.asConverterFactory
import kotlinx.serialization.json.Json
import okhttp3.MediaType
import retrofit2.Retrofit
//import retrofit2.converter.scalars.ScalarsConverterFactory
import retrofit2.http.GET



private const val BASE_URL = "https://android-kotlin-fun-mars-server.appspot.com"  // URL de base del servicio WEB de Marte

private val retrofit = Retrofit.Builder()
    .addConverterFactory(Json.asConverterFactory(MediaType.get("application/json")))
    .baseUrl(BASE_URL)
    .build() // Se crea el objeto retrofit


interface MarsApiService {    //MarsApiService define cómo Retrofit se comunica con el servidor web mediante solicitudes HTTP.
    @GET("photos")    //Cuando se invoca el método getPhotos(), Retrofit agrega el extremo photos a la URL de base (que definiste en el compilador de Retrofit) que se usó para iniciar la solicitud
    suspend fun getPhotos():List<MarsPhoto>




}

// CREA A RETROFIT SERVICES

object MarsApi {  // Este es un objeto singleton que se crea en el primer acceso es accesible desde cualquier clase
    val retrofitService : MarsApiService by lazy {
        retrofit.create(MarsApiService::class.java)   //todo     No entiendo que hace aquí
    }
}















