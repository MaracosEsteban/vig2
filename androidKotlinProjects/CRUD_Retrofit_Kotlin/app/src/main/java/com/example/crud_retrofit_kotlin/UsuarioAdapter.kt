package com.example.crud_retrofit_kotlin

import android.content.Context
import android.view.View
import android.view.ViewGroup
import androidx.recyclerview.widget.RecyclerView
import androidx.recyclerview.widget.RecyclerView.RecycledViewPool
import androidx.recyclerview.widget.RecyclerView.ViewHolder

class UsuarioAdapter (
    var context: Context,
    var litaUsuarios: ArrayList<Usuario>
    ): RecyclerView.Adapter<UsuarioAdapter.UsuarioViewHolder>(){

        inner class UsuarioViewHolder(itemView: View): ViewHolder(itemView)

    override fun onCreateViewHolder(parent: ViewGroup, viewType: Int): UsuarioViewHolder {
        TODO("Not yet implemented")
    }

    override fun getItemCount(): Int {
        TODO("Not yet implemented")
    }

    override fun onBindViewHolder(holder: UsuarioViewHolder, position: Int) {
        TODO("Not yet implemented")
    }
}
)

        //todo minuto 16