package com.example.marsphotos.data


import com.example.marsphotos.network.MarsApiService
import retrofit2.Retrofit
import com.jakewharton.retrofit2.converter.kotlinx.serialization.asConverterFactory
import kotlinx.serialization.json.Json
import okhttp3.MediaType.Companion.toMediaType

/**
 * Un contenedor es un objeto que contiene las dependencias que requiere la app. Estas dependencias se usan en toda la aplicación,
 * por lo que deben estar en un lugar común que todas las actividades puedan usar. Puedes crear una subclase de la clase Application y
 * almacenar una referencia al contenedor.
 */





interface AppContainer {
    val marsPhotosRepository: MarsPhotosRepository
}



class DefaultAppContainer(override val marsPhotosRepository: MarsPhotosRepository) : AppContainer {

    private val BASE_URL =
        "https://android-kotlin-fun-mars-server.appspot.com"

    private val retrofit: Retrofit = Retrofit.Builder()
        .addConverterFactory(Json.asConverterFactory("application/json".toMediaType()))
        .baseUrl(BASE_URL)
        .build()

    private val retrofitService: MarsApiService by lazy {
        retrofit.create(MarsApiService::class.java)
    }

}


//class DefaultAppContainer : AppContainer {
//
//    private val BASE_URL =
//        "https://android-kotlin-fun-mars-server.appspot.com"
//
//    private val retrofit: Retrofit = Retrofit.Builder()
//        .addConverterFactory(Json.asConverterFactory("application/json".toMediaType()))
//        .baseUrl(BASE_URL)
//        .build()
//
//    private val retrofitService: MarsApiService by lazy {
//        retrofit.create(MarsApiService::class.java)
//    }
//
//}

