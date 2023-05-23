package com.example.prueba

import android.os.Bundle
import androidx.activity.ComponentActivity
import androidx.activity.compose.setContent
import androidx.compose.foundation.BorderStroke
import androidx.compose.foundation.Image
import androidx.compose.foundation.border
import androidx.compose.foundation.layout.*
import androidx.compose.foundation.lazy.LazyColumn
import androidx.compose.foundation.lazy.items
import androidx.compose.foundation.shape.RoundedCornerShape
import androidx.compose.material.*
import androidx.compose.runtime.*
import androidx.compose.runtime.saveable.rememberSaveable
import androidx.compose.ui.Alignment
import androidx.compose.ui.Modifier
import androidx.compose.ui.graphics.Color
import androidx.compose.ui.layout.ContentScale
import androidx.compose.ui.res.painterResource
import androidx.compose.ui.unit.dp
import androidx.compose.ui.unit.sp
import com.example.prueba.data.DataSource
import com.example.prueba.model.Estudiante
import com.example.prueba.ui.theme.PruebaTheme
import com.example.prueba.ui.theme.PruebaViewModel
import androidx.lifecycle.viewmodel.compose.viewModel


class MainActivity : ComponentActivity() {
    override fun onCreate(savedInstanceState: Bundle?) {
        super.onCreate(savedInstanceState)
        setContent {
            PruebaTheme {
                // A surface container using the 'background' color from the theme
                Surface(
                    modifier = Modifier.fillMaxSize(),
                    color = MaterialTheme.colors.background
                ) {
                    Greeting()
                }
            }
        }
    }
}

@Composable
fun Greeting(
    modifier: Modifier = Modifier,
    pruebaViewModel: PruebaViewModel = viewModel()
) {
    val pruebaUiState by pruebaViewModel.uiState.collectAsState()

//    var nombre by rememberSaveable { mutableStateOf("") }
//    var password by rememberSaveable { mutableStateOf("") }
//    var pantActual by rememberSaveable { mutableStateOf(1) }
//    var lastScreen: Int by rememberSaveable { mutableStateOf(1) }  //Guarda la útlima pantalla antes de entrar a set Up


    when (pruebaUiState.currentScreen) {


        1 -> {
            Column(
                modifier = Modifier
                    .padding(32.dp)
                    .fillMaxSize(),
                verticalArrangement = Arrangement.SpaceAround,
                horizontalAlignment = Alignment.CenterHorizontally
            ) {
                Image(
                    painter = painterResource(R.drawable._0230416_130941),
                    contentDescription = null,
                    contentScale = ContentScale.Fit,
                    modifier = Modifier
                        .border(
                            BorderStroke(2.dp, Color(105, 205, 216)),
                            shape = RoundedCornerShape(4.dp),
                        )
                        .padding(16.dp)
                )
                OutlinedTextField(
                    singleLine = true,
                    value = pruebaViewModel.nameEntry,
                    onValueChange = { pruebaViewModel.actulizarNameEntry(it) },
                    label = { Text("Nombre Usuario") },
                    isError = pruebaUiState.userDataWrong,
                )
                OutlinedTextField(
                    singleLine = true,
                    value = pruebaViewModel.passEntry,
                    onValueChange = { pruebaViewModel.actulizarPassEntry(it) },
                    label = {
                        Text("Ingrese su Password")
                    },
                    isError = pruebaUiState.userDataWrong,
                )

                Button(onClick = {
                    if(pruebaViewModel.ChecquearDatos()){
                        pruebaViewModel.CambiarPantalla(2)
                    }else{ }


//                    pruebaViewModel.ChecquearDatos()
//                    if (pruebaUiState.userDataWrong) {
//
//                    } else {
//                        pruebaViewModel.CambiarPantalla(2)
//                    }


                }) {
                    Text(text = "Login")
            }
        }}

        2 -> {
            Column(
                modifier = Modifier
                    .padding(32.dp)
                    .fillMaxSize(),
                verticalArrangement = Arrangement.Center,
                horizontalAlignment = Alignment.CenterHorizontally
            ) {


                Scaffold(bottomBar = {
                    //Scaffold(topBar = {
                    Row(
                        horizontalArrangement = Arrangement.SpaceAround,
                        modifier = Modifier
                            .fillMaxWidth()

                    ) {
                        Button(
                            onClick = { pruebaViewModel.CambiarPantalla(3) },
                            //modifier = Modifier.padding(8.dp)
                        ) {
                            Text(text = "Setup")

                        }

                        Button(
                            onClick = {
                                pruebaViewModel.BorrrNyP(); pruebaViewModel.CambiarPantalla(
                                1
                            )
                            },
                            // modifier = Modifier.padding(8.dp)
                        ) {
                            Text(text = "Logout")
                        }

                        Button(
                            onClick = { System.exit(1) },
                            //  modifier = Modifier.padding(8.dp)
                        ) {
                            Text(text = "Salir")
                        }

                    }
                }) {

                    LazyColumn {
                        items(DataSource().cargarEstudiantes()) { estudiante ->
                            TarjetaEstudiante(estudiante)
                        }
                    }
                }
            }
        }
        3 -> {
            Column(
                modifier = Modifier
                    .padding(32.dp)
                    .fillMaxSize(),
                verticalArrangement = Arrangement.SpaceAround,
                horizontalAlignment = Alignment.CenterHorizontally
            ) {
                Text(text = "SetUp")
                Button(
                    onClick = { pruebaViewModel.CambiarPantalla(2) },
                    modifier = Modifier.padding(8.dp)
                ) {
                    Text(text = "Volver")
                }
            }
        }
        else -> {}
    }
}


@Composable
fun TarjetaEstudiante(estudiante: Estudiante, modifier: Modifier = Modifier) {

    Card(
        modifier = Modifier
            .padding(8.dp)
            .fillMaxWidth(),
        elevation = 4.dp
    ) {
        Column {

            Text(
                text = estudiante.nombre,
                modifier = Modifier.padding(16.dp),
                style = MaterialTheme.typography.h6
            )

            Row(horizontalArrangement = Arrangement.SpaceAround) {
                Text(
                    fontSize = 15.sp,
                    text = estudiante.pais,
                    modifier = Modifier.padding(12.dp),
                    style = MaterialTheme.typography.h6
                )


                Text(
                    fontSize = 15.sp,
                    text = estudiante.ciudad,
                    modifier = Modifier.padding(12.dp),
                    style = MaterialTheme.typography.h6
                )
            }
        }
    }
}


//
//@Composable
//fun TresBotones(pantActual: Array<Int>) {
//    Row(
//        horizontalArrangement = Arrangement.Center
//    ) {
//        Button(
//            onClick = { /*TODO*/ },
//            modifier = Modifier.padding(8.dp)
//        ) {
//            Text(text = "Setup")
//
//        }
//
//        Button(
//            onClick = { pantActual[0] = 1 },
//            modifier = Modifier.padding(8.dp)
//        ) {
//            Text(text = "Logout")
//        }
//
//        Button(
//            onClick = { /*TODO*/ },
//            modifier = Modifier.padding(8.dp)
//        ) {
//            Text(text = "Salir")
//        }
//
//    }
//
//
//}


//@Preview(showBackground = true)
@Composable
fun DefaultPreview() {
    PruebaTheme {
        Greeting(modifier = Modifier)
    }
}