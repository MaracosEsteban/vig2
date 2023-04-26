package com.example.pruebafragment


import android.os.Bundle
import android.view.LayoutInflater
import android.view.View
import android.view.ViewGroup
import androidx.databinding.DataBindingUtil
import androidx.databinding.ViewDataBinding
import androidx.fragment.app.Fragment



class FragmentoSegundo: Fragment() {
    override fun onCreateView(inflater: LayoutInflater, container: ViewGroup?,
                              savedInstanceState: Bundle?): View? {
        // Inflate the layout for this fragment
        val binding: ViewDataBinding? = DataBindingUtil.inflate(
            inflater, R.layout.SegundoFragmento, container, false)
        return binding?.root
        //return binding.root
    }

}