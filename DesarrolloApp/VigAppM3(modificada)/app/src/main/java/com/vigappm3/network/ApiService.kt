package com.vigappm3.network


import android.graphics.Movie
import com.vigappm3.model.Usuario
import com.jakewharton.retrofit2.converter.kotlinx.serialization.asConverterFactory
import com.vigappm3.model.ConsCentros
import com.vigappm3.model.ConsUsuarios
import com.vigappm3.model.GuardarLecturas
import com.vigappm3.model.Lectura

import kotlinx.serialization.ExperimentalSerializationApi
import kotlinx.serialization.json.Json
import okhttp3.MediaType
import retrofit2.Retrofit
import retrofit2.http.Body
import retrofit2.http.GET
import retrofit2.http.POST
import retrofit2.http.Path


private const val BASE_URL = "http://10.0.2.2:3000/"
//    "https://android-kotlin-fun-mars-server.appspot.com"


/**
 * Use the Retrofit builder to build a retrofit object using a kotlinx.serialization converter
 */
@OptIn(ExperimentalSerializationApi::class)
private val retrofit = Retrofit.Builder()
    .addConverterFactory(Json.asConverterFactory(MediaType.get("application/json")))
    .baseUrl(BASE_URL)
    .build()

/**
 * Retrofit service object for creating api calls
 */
interface MarsApiService {




     /**
     * S1: Leer un usuario en base a su nombre(pueden no existir)
     */
    @GET("usuario/{nombre}")
    suspend fun getUsuario(@Path("nombre") nombre: String):  List<ConsUsuarios>


    /**
     * S2: Recupera la informacion de todos los centros
     */
    @GET("centros")
    suspend fun getCenros(): List<ConsCentros>


    /**
     * S3: Genera un nuevo registro enla tabla lecturas
     */

    @POST("registro")
    suspend fun crearLectura(@Body lectura:List<Lectura>):List<GuardarLecturas>

    /**
     * S4. Recuperar todas las lecturas según fechas Seleccionadas
     */












}









/**
 * A public Api object that exposes the lazy-initialized Retrofit service
 */
object VigApi {
    val retrofitService: MarsApiService by lazy {
        retrofit.create(MarsApiService::class.java)
    }
}






