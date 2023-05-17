package com.vigappm3.network


import com.vigappm3.model.Usuario
import com.jakewharton.retrofit2.converter.kotlinx.serialization.asConverterFactory
import kotlinx.serialization.json.Json
import okhttp3.MediaType
import retrofit2.Retrofit
import retrofit2.http.GET



private const val BASE_URL ="localhost:3000"
//    "https://android-kotlin-fun-mars-server.appspot.com"



/**
 * Use the Retrofit builder to build a retrofit object using a kotlinx.serialization converter
 */
private val retrofit = Retrofit.Builder()
    .addConverterFactory(Json.asConverterFactory(MediaType.get("application/json")))
    .baseUrl(BASE_URL)
    .build()
/**
 * Retrofit service object for creating api calls
 */
interface MarsApiService {
    @GET("/usuarios")
    suspend fun getGetUsuarios():List<Usuario>

//    @GET("usuario")
//    suspend fun getGetUsuario():Usuario
}


/**
 * A public Api object that exposes the lazy-initialized Retrofit service
 */
object VigApi {
    val retrofitService: MarsApiService by lazy {
        retrofit.create(MarsApiService::class.java)
    }
}


