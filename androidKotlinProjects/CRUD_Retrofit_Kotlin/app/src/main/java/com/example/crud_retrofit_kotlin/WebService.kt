package com.example.crud_retrofit_kotlin

import com.example.crud_retrofit_kotlin.databinding.ItemRvUsuarioBinding
import com.google.gson.GsonBuilder
import retrofit2.Response
import retrofit2.Retrofit
import retrofit2.converter.gson.GsonConverterFactory
import retrofit2.http.Body
import retrofit2.http.DELETE
import retrofit2.http.GET
import retrofit2.http.POST
import retrofit2.http.PUT
import retrofit2.http.Path


object AppConstantes{

    const val BASE_URL="http://192.168.2.14:3000"
    // provablemente dirección válida solo en mi ordenador
}



interface WebService {
    @GET("/usuarios")
    suspend fun obtenerUsuarios(): Response<UsuariosResponse>

    @GET("/usuario/{idUsuario}")
    suspend fun obtenerUsuario(
        @Path("idUsuario") idUsurio: Int
    ): Response<Usuario>

    @POST("/usuario/add")
    suspend fun agregarUsuario(
        @Body usuario: Usuario
    ): Response<String>


    @PUT("/usuario/update/{idUsuario}")
    suspend  fun actulizarUsuario(
        @Path("idUsuario") idUsuario: Int,
        @Body usuario: Usuario
        ) : Response<String>

    @DELETE("/usuario/delete/{id}")
    suspend fun borrarUsuario(
        @Path("idUsuario") idUsuario: Int
    ): Response<String>
}


    object RetrofitClient {
        val webService: WebService by lazy{

            Retrofit.Builder()
                .baseUrl(AppConstantes.BASE_URL)
                .addConverterFactory(GsonConverterFactory.create(GsonBuilder().create()))
                .build().create(WebService::class.java)
        }
    }



