package com.vigappm3.ui

import androidx.compose.foundation.layout.*
import androidx.compose.foundation.lazy.LazyColumn
import androidx.compose.material3.OutlinedButton
import androidx.compose.material3.Text
import androidx.compose.runtime.Composable
import androidx.compose.runtime.collectAsState
import androidx.compose.runtime.getValue
import androidx.compose.ui.Modifier
import androidx.compose.ui.res.dimensionResource
import androidx.compose.ui.res.stringResource
import androidx.compose.ui.tooling.preview.Preview
import androidx.compose.ui.unit.dp
import androidx.compose.ui.unit.sp
import com.vigappm3.R
import com.vigappm3.model.Centro
import androidx.compose.foundation.lazy.items
import androidx.compose.material3.Card
import androidx.compose.material3.CardElevation


@Composable
fun SelecCentroScreen(
    onCancelButtonClicked: () -> Unit,
    onSelecCenterClicked: () -> Unit,
    modifier: Modifier = Modifier,
    viewM: VigAppViewModel,

) {

    val uiState by viewM.uiState.collectAsState()




    Column(
//                verticalArrangement = Arrangement.spacedBy(dimensionResource(R.dimen.padding_small))
        verticalArrangement = Arrangement.Center,
        modifier = Modifier
            .fillMaxSize()
            .fillMaxWidth()

    ) {

        LazyColumn {
            // todo obtener la informacion de AppUiState

            items(uiState.listaCentros) { centro ->
                TarjetaCentro(centro)
            }

        }


            OutlinedButton(
                modifier = Modifier
                    .fillMaxWidth()
                    .wrapContentWidth(),
                onClick = onCancelButtonClicked
            ) {
                Text(stringResource(R.string.cancel))
            }
        }
    }






    @Composable
    fun TarjetaCentro(centro: Centro, modifier: Modifier = Modifier) {

        Card(
//            elevation = CardElevation(4.dp),
            modifier = Modifier
                .padding(8.dp)
                .fillMaxWidth(),
        ) {
            Column() {

                Text(
                    text = centro.NOMBRE,
                    modifier = Modifier.padding(16.dp),
//                    style = MaterialTheme.typography.h6
                )

                Row(horizontalArrangement = Arrangement.SpaceAround) {
                    Text(
                        fontSize = 15.sp,
                        text = centro.CIUDAD,
                        modifier = Modifier.padding(12.dp),
//                        style = MaterialTheme.typography.h6
                    )


                    Text(
                        fontSize = 15.sp,
                        text = centro.CIUDAD,
                        modifier = Modifier.padding(12.dp),
//                        style = MaterialTheme.typography.h6
                    )
                }
            }
        }
    }

























//
//@Preview
//@Composable
//fun SelecCentroScreenPreview() {
//    SelecCentroScreen(
//        onCancelButtonClicked = {},
//        onSelecCenterClicked = {},
//        modifier = Modifier
//            .padding(dimensionResource(R.dimen.padding_medium))
//            .fillMaxSize()
//    )
//}
//
