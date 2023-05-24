package com.example.artspace

import android.os.Bundle
import android.widget.Toast
import androidx.activity.ComponentActivity
import androidx.activity.compose.setContent
import androidx.compose.foundation.*
import androidx.compose.foundation.layout.*
import androidx.compose.foundation.shape.RoundedCornerShape
import androidx.compose.material.*
import androidx.compose.material.NavigationRailDefaults.Elevation
import androidx.compose.runtime.*
import androidx.compose.ui.Alignment
import androidx.compose.ui.Modifier
import androidx.compose.ui.graphics.Color
import androidx.compose.ui.layout.ContentScale
import androidx.compose.ui.res.painterResource
import androidx.compose.ui.text.font.FontWeight
import androidx.compose.ui.tooling.preview.Preview
import androidx.compose.ui.unit.dp
import androidx.compose.ui.unit.sp
import com.example.artspace.ui.theme.ArtSpaceTheme

class MainActivity : ComponentActivity() {
    override fun onCreate(savedInstanceState: Bundle?) {
        super.onCreate(savedInstanceState)
        ArtWorks().CargarDatos()// => se cargan las 5 fotos en el companon object de la clase ArtWork


        setContent {
            ArtSpaceTheme {
                // A surface container using the 'background' color from the theme
                Surface(
                    modifier = Modifier.fillMaxSize(),
                    color = MaterialTheme.colors.background
                ) {
                    ArtSpaceTheme {
                        ArtSpaceScreen()
                    }
                }
            }
        }
    }

    data class ArtWork(
        val photo: Int,
        val title: String,
        val artist: String,
        val year: String,
        val morInfo: String
    )

    class ArtWorks {
        companion object {
            private var works = mutableListOf<ArtWork>()
            private var selecWork: Int = 0
        }

        fun CargarDatos() {
            works.add(
                ArtWork(
                    R.drawable._0230322_181319,
                    "La Tarde",
                    "Jose Aranda",
                    "(2021)",
                    "Lorem ipsum dolor sit amet, nam ad ipsum dicant impedit, solum partem recusabo ad est. Ne quaestio honestatis vis, vix eu vituperata ullamcorper, sea solum torquatos eu. "
                )
            )
            works.add(
                ArtWork(
                    R.drawable._0230326_171139,
                    "El paseo",
                    "Manuel Pinto",
                    "(2025)",
                    "Sit ut quando nostrud, congue omittantur neglegentur ut est. Modus saepe omnium ex vel, quodsi timeam ne sed. Quo alterum deserunt in, mea ex exerci graeco, oratio "
                )
            )
            works.add(
                ArtWork(
                    R.drawable._0230331_153948,
                    "La senda",
                    "Adrian Mancero",
                    "(2022)",
                    "Ad feugiat graecis aliquando eum, eu pri dicant utroque minimum, purto euismod convenire at qui. Per te ludus recteque sadipscing, ut voluptua sadipscing vix."
                )
            )
            works.add(
                ArtWork(
                    R.drawable._0230416_130624,
                    "Aparcada",
                    "Fernando Brosso",
                    "(2022)",
                    "Et enim posidonium per, duo ad quod vero cotidieque. Vix id lorem civibus honestatis, porro laoreet abhorreant at eum, eu vix affert dissentias. Inani disputando usu no."
                )
            )
            works.add(
                ArtWork(
                    R.drawable._0230416_130941,
                    "Diseño",
                    "Ariel Manzanares",
                    "(2023)",
                    "d vix posse consul legere, ut est audiam nonumes reprehendunt. Iudico appetere assueverit cum et, wisi omnis oporteat in sed, per choro inermis lucilius ut. Urbanitas "
                )
            )
            selecWork = 0
        }

        fun next(): ArtWork {
            return (if (selecWork < works.lastIndex) {
                works[++selecWork]
            } else {
                selecWork = 0; works[selecWork]
            })
        }

        fun previous(): ArtWork {
            return (if (selecWork > 0) {
                works[--selecWork]
            } else {
                selecWork = works.lastIndex; works[selecWork]
            })
        }

        fun actual(): ArtWork {
            return works[selecWork]
        }
    }


    @Composable
    fun ArtSpaceScreen() {
        var drawableResourceId by remember { mutableStateOf(ArtWorks().actual().photo) }
        var title by remember { mutableStateOf(ArtWorks().actual().title) }
        var artist by remember { mutableStateOf(ArtWorks().actual().artist) }
        var year by remember { mutableStateOf(ArtWorks().actual().year) }
        var morInfo by remember { mutableStateOf(ArtWorks().actual().morInfo) }



        Column(modifier = Modifier.fillMaxSize()) {
            Surface(
                modifier = Modifier
                    .padding(all = 16.dp)
                    .weight(10f)
                    .fillMaxWidth()
                    .height(60.dp)
                    .wrapContentSize(),


                // .background(Color.Yellow)
                // verticalArrangement = Arrangement.Center,
                //  horizontalAlignment = Alignment.CenterHorizontally

                //  .padding(16.dp)

            ) {
                Image(
                    painter = painterResource(drawableResourceId),
                    contentDescription = null,
                    contentScale = ContentScale.Fit,
                    modifier = Modifier
                        .border(
                            BorderStroke(2.dp, Color(105, 205, 216)),
                            shape = RoundedCornerShape(4.dp),
                        )
                        .padding(16.dp)

                )
            }
            Spacer(Modifier.height(4.dp))

            Column(
                modifier = Modifier
                    .padding(all = 16.dp)
                    .weight(3f)
                    .fillMaxWidth()
                    .height(60.dp)
                    // .background(Color.Blue)
                    .border(
                        BorderStroke(2.dp, Color(105, 205, 216)),
                        shape = RoundedCornerShape(4.dp),
                    )
                    .padding(16.dp),
                verticalArrangement = Arrangement.SpaceAround,
                horizontalAlignment = Alignment.CenterHorizontally
            ) {
                Text(
                    text = title,

                    fontSize = 36.sp,
                    modifier = Modifier
                        //.fillMaxWidth()
                        .wrapContentSize()
                        .padding(start = 16.dp, end = 16.dp)
                )
                Row(
                    horizontalArrangement = Arrangement.Center,
                    verticalAlignment = Alignment.CenterVertically,

                    ) {
                    Text(
                        text = artist,
                        fontSize = 24.sp,

                        modifier = Modifier
                            .wrapContentSize()
                            .padding(vertical = 8.dp),
                        // .padding(start = 16.dp, end = 16.dp),
                        fontWeight = FontWeight.Bold
                    )
                    Text(

                        text = year,
                        fontSize = 24.sp,
                        modifier = Modifier
                            .padding(vertical = 8.dp)
                            .wrapContentSize()
                        //.padding(start = 16.dp, end = 16.dp)
                    )
                }
            }


            Spacer(Modifier.height(4.dp))


            Row(
                modifier = Modifier
                    .padding(horizontal = 16.dp)
                    .weight(1f)
                    .fillMaxWidth()
                    .height(60.dp),
                // .background(Color.Green),
                horizontalArrangement = Arrangement.SpaceAround,
                verticalAlignment = Alignment.CenterVertically
            ) {
                // Fila que contendrá los botones Previo y Siguiente


                Button(
                    onClick = {
                        val art: ArtWork = ArtWorks().previous();drawableResourceId =
                        art.photo;title =
                        art.title;artist = art.artist;year = art.year
                    },
                    modifier = Modifier
                        .wrapContentSize()
                )
                {
                    Text(text = "Previous")
                }

                Button(
                    onClick = {
                        val art: ArtWork = ArtWorks().next()


                        Toast.makeText(this@MainActivity, art.morInfo, Toast.LENGTH_SHORT).show()
                        drawableResourceId = art.photo
                        title = art.title;artist = art.artist
                        year = art.year
                        morInfo = art.morInfo
                    },

                    modifier = Modifier.wrapContentSize(),


                )
                {
                    Text(text = "   Next   ")
                }
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
}