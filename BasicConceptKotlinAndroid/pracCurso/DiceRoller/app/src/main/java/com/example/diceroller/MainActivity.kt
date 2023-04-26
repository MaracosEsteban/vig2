package com.example.diceroller

import androidx.appcompat.app.AppCompatActivity
import android.os.Bundle
import android.widget.Button
import android.widget.ImageView
import android.widget.TextView
import android.widget.Toast

/* In onCreate(), you specify which layout is associated with the activity, and you inflate the layout. The setContentView()
 method does both those things. */

class MainActivity : AppCompatActivity() {

    lateinit var rollButton: Button
    lateinit var imageDice: ImageView

    //The lateinit keyword promises the Kotlin compiler that the variable will be initialized before the code calls any operations on it


    override fun onCreate(savedInstanceState: Bundle?) {
        super.onCreate(savedInstanceState)
        setContentView(R.layout.activity_main)


        rollButton = findViewById(R.id.roll_button)
        imageDice = findViewById(R.id.dice_image)


        rollButton.setOnClickListener { rollDice() }
    }


    private fun rollDice() {

//        Toast.makeText(this, "button clicked",
//            Toast.LENGTH_SHORT).show()

        //resultTextView.text="Dice Roller"
        // resultTextView.text=(1..6).random().toString()


        var numResourse = when ((1..6).random()) {
            1 -> {
                R.drawable.dice_1
            }
            2 -> {
                R.drawable.dice_2
            }
            3 -> {
                R.drawable.dice_3
            }
            4 -> {
                R.drawable.dice_4
            }
            5 -> {
                R.drawable.dice_5
            }
            else -> {
                R.drawable.dice_6
            }
        }
        imageDice.setImageResource(numResourse)
    }
}






//. The R class is generated when you build your app. The R class includes all the app's assets, including the contents of the res directory.