package com.example.artspace

import android.os.Bundle
import androidx.activity.ComponentActivity
import androidx.activity.compose.setContent
import androidx.compose.foundation.background
import androidx.compose.foundation.layout.*
import androidx.compose.material.MaterialTheme
import androidx.compose.material.Surface
import androidx.compose.runtime.Composable
import androidx.compose.ui.Modifier
import androidx.compose.ui.tooling.preview.Preview
import androidx.compose.ui.unit.dp
import com.example.artspace.ui.theme.ArtSpaceTheme

class MainActivity : ComponentActivity() {
    override fun onCreate(savedInstanceState: Bundle?) {
        super.onCreate(savedInstanceState)
        setContent {
            ArtSpaceTheme {
                // A surface container using the 'background' color from the theme
                Surface(
                    modifier = Modifier.fillMaxSize(),
                    color = MaterialTheme.colors.background
                ) {
                    ArtSpaceScreen()
                }
            }
        }
    }
}

@Composable
fun ArtSpaceScreen() {

    Column(modifier = Modifier.fillMaxSize()) {

        Column(
            modifier = Modifier
                .fillMaxWidth()
                .height(60.dp)
                .background(androidx.compose.ui.graphics.Color.Yellow)

        ) {


    }

        Spacer(Modifier.height(8.dp))

        Column(  modifier = Modifier
            .fillMaxWidth()
            .height(60.dp)
            .background(androidx.compose.ui.graphics.Color.Blue) ){                          // Columna que contendrá el título de la obra y el año de la obra

        }

        Spacer(Modifier.height(8.dp))

        Row( modifier = Modifier
            .fillMaxWidth()
            .height(60.dp)
            .background(androidx.compose.ui.graphics.Color.Green) ){                               // Fila que contendrá los botones Previo y Siguiente

        }


    }


}


@Preview(showBackground = true)
@Composable
fun ArtSpacePreview() {
    ArtSpaceTheme {

        ArtSpaceScreen()
    }
}