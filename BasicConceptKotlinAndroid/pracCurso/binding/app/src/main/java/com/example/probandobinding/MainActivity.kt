package com.example.probandobinding

import androidx.appcompat.app.AppCompatActivity
import android.os.Bundle
import android.widget.Toast
import com.example.probandobinding.databinding.ActivityMainBinding

class MainActivity : AppCompatActivity() {
    private lateinit var binding : ActivityMainBinding
    override fun onCreate(savedInstanceState: Bundle?) {
        super.onCreate(savedInstanceState)

        binding = ActivityMainBinding.inflate(layoutInflater)
        setContentView(binding.root)

        binding.btnToast.setOnClickListener{MyToast()}
    }


    private fun MyToast(){
        Toast.makeText(this,"Buenos días !!...Toast!",Toast.LENGTH_SHORT).show()
        // probar como accedo al texto de un boton

    }





}