package com.example.crud_retrofit_kotlin

import android.os.Binder
import androidx.appcompat.app.AppCompatActivity
import android.os.Bundle
import androidx.recyclerview.widget.LinearLayoutManager
import com.example.crud_retrofit_kotlin.databinding.ActivityMainBinding

class MainActivity : AppCompatActivity() {

    lateinit var  binding:ActivityMainBinding
    lateinit var  adaptador: UsuarioAdapter

    var listaUsuarios = arrayListOf<Usuario>()

    var usuario = Usuario(-1,"","")

    var idEditando = false
    override fun onCreate(savedInstanceState: Bundle?) {
        super.onCreate(savedInstanceState)
        binding = ActivityMainBinding.inflate(layoutInflater)
        setContentView(binding.root)

        binding.rvUsuarios.layoutManager = LinearLayoutManager(this)
        setupRecyclerView()
    }

    fun setupRecyclerView(){
        adaptador=UsuarioAdapter(this. listaUsuarios)
        adaptador.setOnClik(this@MainActivity)
        binding.rvUsuarios.adapter = adaptador
    }
}