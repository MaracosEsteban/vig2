package com.example.limonade

import android.os.Bundle
import androidx.activity.ComponentActivity
import androidx.activity.compose.setContent
import androidx.compose.foundation.Image
import androidx.compose.foundation.border
import androidx.compose.foundation.layout.*
import androidx.compose.material.Button
import androidx.compose.material.MaterialTheme
import androidx.compose.material.Surface
import androidx.compose.material.Text
import androidx.compose.runtime.*
import androidx.compose.ui.Alignment
import androidx.compose.ui.Modifier
import androidx.compose.ui.graphics.Color
import androidx.compose.ui.res.painterResource
import androidx.compose.ui.res.stringResource
import androidx.compose.ui.tooling.preview.Preview
import androidx.compose.ui.unit.dp
import androidx.compose.ui.unit.sp
import com.example.limonade.ui.theme.LimonadeTheme



class MainActivity : ComponentActivity() {
    override fun onCreate(savedInstanceState: Bundle?) {
        super.onCreate(savedInstanceState)
        setContent {
            LimonadeTheme {
                // A surface container using the 'background' color from the theme
                Surface(
                    modifier = Modifier.fillMaxSize(),
                    color = MaterialTheme.colors.background
                ) {
                    LimonadeApp(modifier=Modifier  .fillMaxSize()
                        .wrapContentSize(Alignment.Center))
                }
            }
        }
    }
}


@Preview(showBackground = true)
@Composable
fun LimonadeAppPreview() {
    LimonadeApp(
        modifier = Modifier
            .fillMaxSize()
            .wrapContentSize(Alignment.Center)
    )
}


@Composable
fun LimonadeApp(modifier: Modifier) {
    var clicks by remember{ mutableStateOf(0) }
    var clikMade by remember { mutableStateOf(0) }
    var counter by remember { mutableStateOf(1) }
    var titleImage: String
    val imageResource = when (counter) {
        1 -> {
            titleImage = stringResource(id = R.string.title_one)
            clicks = (1..6).random()
            R.drawable.lemon_tree
        }
        2 -> {
            titleImage = stringResource(id = R.string.title_two)
            R.drawable.lemon_squeeze
        }
        3 -> {
            titleImage = stringResource(id = R.string.title_three)
            R.drawable.lemon_drink
        }
        else -> {
            clikMade = 0        // se resetea a 5 cada vez que paso por la primera imagen
            titleImage = stringResource(id = R.string.title_four)
            R.drawable.lemon_restart
        }
    }


    Column(modifier = modifier, horizontalAlignment = Alignment.CenterHorizontally) {
        Text(
            text = titleImage,
            fontSize = 18.sp,
        )
        Spacer(modifier = Modifier.height(16.dp))
        Button(
            onClick = {
                if (counter <= 3) {
                    if (counter == 2) {
                        if (clikMade < clicks) {
                            clikMade++
                        } else {
                            counter++
                        }
                    } else {
                        counter++
                    }
                } else {
                    counter = 1
                }
            },
            modifier = Modifier.border(
                8.dp, Color.Black
            )
        ) {
            Image(painter = painterResource(imageResource), contentDescription = counter.toString())
        }
    }
}




