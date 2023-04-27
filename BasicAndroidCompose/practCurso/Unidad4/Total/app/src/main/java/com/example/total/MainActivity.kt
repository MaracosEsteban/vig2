package com.example.total


import android.os.Bundle
import androidx.activity.ComponentActivity
import androidx.activity.compose.setContent
import androidx.compose.foundation.layout.*
import androidx.compose.material.Button
import androidx.compose.material.MaterialTheme
import androidx.compose.material.Surface
import androidx.compose.material.Text
import androidx.compose.runtime.*
import androidx.compose.runtime.saveable.rememberSaveable
import androidx.compose.ui.Alignment
import androidx.compose.ui.Modifier
import androidx.compose.ui.tooling.preview.Preview
import androidx.compose.ui.unit.dp
import androidx.lifecycle.ViewModel
import androidx.lifecycle.viewmodel.*
//import androidx.lifecycle.viewmodel.compose.viewModel
import com.example.total.ui.theme.TotalTheme
import androidx.lifecycle.viewmodel.compose.viewModel
import androidx.lifecycle.ViewModelProvider


class MainActivity : ComponentActivity() {
    override fun onCreate(savedInstanceState: Bundle?) {
        super.onCreate(savedInstanceState)
        setContent {
            TotalTheme {
                // A surface container using the 'background' color from the theme
                Surface(
                    modifier = Modifier.fillMaxSize(),
                    color = MaterialTheme.colors.background
                ) {
                    Greeting("Android")
                }
            }
        }
    }
}

@Composable
fun Greeting( name: String, modifier: Modifier = Modifier, myViewModel: MyViewModel= viewMoldel()) {
    var totalGeneral by rememberSaveable { mutableStateOf(0) }
    var subTotal by rememberSaveable { mutableStateOf(5) }

    val myState by MyViewModel().uiState.collectAsState()


    Column(
        modifier = modifier
            .fillMaxSize(),
        horizontalAlignment = Alignment.CenterHorizontally,
        verticalArrangement = Arrangement.Center

    ) {

        Text(text = "Total general")
        Text(text = totalGeneral.toString())



        Spacer(modifier = Modifier.height(32.dp))

        Text(text = subTotal.toString())


        Button(onClick = { totalGeneral += subTotal }) {
            Text("Agregar subtotal")


        }

        Spacer(modifier = Modifier.height(32.dp))


        Button(onClick = { }) {
            Text("Poner a Cero")
        }
    }


}


@Preview(showBackground = true)
@Composable
fun DefaultPreview() {
    TotalTheme {
        Greeting("Android")
    }
}