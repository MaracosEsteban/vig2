package com.example.recyclerview

import androidx.appcompat.app.AppCompatActivity
import android.os.Bundle

class MainActivity : AppCompatActivity() {

    val superheros = listOf(
        SuperHero("Spiderman","Marvel","Peter Parker","https://cursokotlin.com/wp-content/uploads/2017/07/spiderman.jpg"),
        SuperHero("Daredevil","Marvel","Matthew Michel Murdock","https://cursokotlin.com/wp-content/uploads/2017/07/daredevil.jpg"),
        SuperHero("Wolverine","Marvel","James Howlett","https://cursokotlin.com/wp-content/uploads/2017/07/logan.jpg"),
        SuperHero("Batman","DC","Bruce Wayne","https://cursokotlin.com/wp-content/uploads/2017/07/batman.jpg"),
        SuperHero("Thor","Marvel","Thor Odinson","https://cursokotlin.com/wp-content/uploads/2017/07/thor.jpg"),
        SuperHero("Flash","DC","Jay Farrick","https://cursokotlin.com/wp-content/uploads/2017/07/flash.jpg"),
        SuperHero("Green Lantern","DC","Alan Scott","https://cursokotlin.com/wp-content/uploads/2017/07/green-lantern.jpg"),
        SuperHero("Wonder Woman","DC","Princess Diana","https://cursokotlin.com/wp-content/uploads/2017/07/womder_woman.jpg")
    )



    override fun onCreate(savedInstanceState: Bundle?) {
        super.onCreate(savedInstanceState)
        setContentView(R.layout.activity_main)

    }
}