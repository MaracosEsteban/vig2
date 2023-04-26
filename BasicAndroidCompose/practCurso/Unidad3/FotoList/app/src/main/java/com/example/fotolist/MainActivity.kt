package com.example.fotolist

import android.os.Bundle
import androidx.activity.ComponentActivity
import androidx.activity.compose.setContent
import androidx.compose.foundation.Image
import androidx.compose.foundation.layout.*
import androidx.compose.foundation.lazy.LazyColumn
import androidx.compose.foundation.lazy.items
import androidx.compose.material.Card
import androidx.compose.material.MaterialTheme
import androidx.compose.material.Surface
import androidx.compose.material.Text
import androidx.compose.runtime.Composable
import androidx.compose.ui.Modifier
import androidx.compose.ui.layout.ContentScale
import androidx.compose.ui.platform.LocalContext
import androidx.compose.ui.res.painterResource
import androidx.compose.ui.res.stringResource
import androidx.compose.ui.tooling.preview.Preview
import androidx.compose.ui.unit.dp
import com.example.fotolist.data.DataSource
import com.example.fotolist.model.FotoTitulo
import com.example.fotolist.ui.theme.FotoListTheme


class MainActivity : ComponentActivity() {
    override fun onCreate(savedInstanceState: Bundle?) {
        super.onCreate(savedInstanceState)
        setContent {
            FotoListTheme {
                // A surface container using the 'background' color from the theme
                Surface(
                    modifier = Modifier.fillMaxSize(),
                    color = MaterialTheme.colors.background
                ) {
                    FotoListApp()
                }
            }
        }
    }
}



@Composable
fun FotoListApp(){

FotoList(fotoTituloList = DataSource().loadFotoTitulos())

}




@Composable
fun FotoList(fotoTituloList: List<FotoTitulo>, modifier: Modifier = Modifier) {
    LazyColumn {
        items(fotoTituloList) { ft ->
            fotoCard(ft)
        }
    }
}






@Composable
fun fotoCard(fotoTitulo: FotoTitulo, modifier: Modifier = Modifier) {
    Card(modifier = Modifier.padding(8.dp), elevation = 4.dp) {
        Column {
            Image(
                painter = painterResource(fotoTitulo.imageResourceId),
                contentDescription = stringResource(fotoTitulo.tituloResource),
                modifier = Modifier
                    .fillMaxWidth()
                    .height(194.dp),
                contentScale = ContentScale.Crop
            )
            Text(
                text = LocalContext.current.getString(fotoTitulo.tituloResource),
                modifier = Modifier.padding(16.dp),
                style = MaterialTheme.typography.h6
            )
        }
    }
}





@Preview
@Composable
private fun FotoCardPreview() {
    fotoCard(fotoTitulo =  FotoTitulo(R.string.descripcion_foto_2, R.drawable._0230320_173940))
    }




