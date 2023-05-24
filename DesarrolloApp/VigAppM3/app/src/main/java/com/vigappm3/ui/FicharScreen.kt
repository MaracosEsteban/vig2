package com.vigappm3.ui

import androidx.compose.foundation.layout.*

import androidx.compose.material3.Button
import androidx.compose.material3.Card
import androidx.compose.material3.ExperimentalMaterial3Api
import androidx.compose.material3.MaterialTheme
import androidx.compose.material3.OutlinedButton
import androidx.compose.material3.Text
import androidx.compose.runtime.Composable
import androidx.compose.runtime.collectAsState
import androidx.compose.runtime.getValue
import androidx.compose.ui.Alignment
import androidx.compose.ui.Modifier
import androidx.compose.ui.res.dimensionResource
import androidx.compose.ui.res.stringResource
import androidx.compose.ui.text.font.FontWeight
import androidx.compose.ui.tooling.preview.Preview
import androidx.compose.ui.unit.dp
import androidx.compose.ui.unit.sp
import androidx.lifecycle.ViewModel
import com.vigappm3.R
import com.vigappm3.model.Centro

@Composable
fun FicharScreen(
    viewM: VigAppViewModel,
    onFichartButtonClicked: () -> Unit,
    onCancelButtonClicked: () -> Unit,
    modifier: Modifier = Modifier.fillMaxSize()
) {
    val uiState by viewM.uiState.collectAsState()
    Column(
        modifier = modifier,
        horizontalAlignment = Alignment.CenterHorizontally,
        verticalArrangement = Arrangement.Center
    ) {

        Text(
            text = stringResource(R.string.cenro_seleccionado),
            modifier = Modifier.align(Alignment.Start),
            fontWeight = FontWeight.Bold
        )



        TarjetaDuplicada(centro = uiState.centroSelec)




        Text(
            text = stringResource(R.string.observaciones),
            modifier = Modifier.align(Alignment.Start),
            fontWeight = FontWeight.Bold
        )

        Row(
            modifier = Modifier
                .fillMaxWidth()
                .padding(dimensionResource(R.dimen.padding_medium)),
            horizontalArrangement = Arrangement.spacedBy(dimensionResource(R.dimen.padding_medium))
        ) {
            OutlinedButton(modifier = Modifier.weight(1f), onClick = onCancelButtonClicked) {
                Text(stringResource(R.string.cancel_fichar).uppercase())
            }
            Button(
                modifier = Modifier.weight(1f),
                onClick = onFichartButtonClicked
            ) {
                Text(stringResource(R.string.fichar).uppercase())
            }
        }
    }
}


//@Preview
//@Composable
//fun FicharScreenPreview() {
//    FicharScreen(
//        onFichartButtonClicked = {},
//        onCancelButtonClicked = {},
//        modifier = Modifier
//            .padding(dimensionResource(R.dimen.padding_medium))
//            .fillMaxSize()
//    )
//}


@OptIn(ExperimentalMaterial3Api::class)
@Composable
fun TarjetaDuplicada(
    centro: Centro,
    modifier: Modifier = Modifier
) {

    Card(

        //  elevation = CardElevation(4.dp),

        modifier = Modifier
            .padding(8.dp)
            .fillMaxWidth()


    ) {
        Column(
            modifier = Modifier.align(Alignment.CenterHorizontally),

            ) {

            Text(
                text = centro.NOMBRE,
                modifier = Modifier.padding(30.dp),

                fontSize = 18.sp,
                fontWeight = FontWeight.Bold,
                style = MaterialTheme.typography.bodySmall
            )

            Row(horizontalArrangement = Arrangement.SpaceBetween) {
                Text(
                    fontSize = 15.sp,
                    text = centro.PAIS,
                    modifier = Modifier.padding(12.dp),
                    style = MaterialTheme.typography.bodySmall
                )
                Text(
                    fontSize = 15.sp,
                    text = centro.CIUDAD,
                    modifier = Modifier.padding(12.dp),
                    style = MaterialTheme.typography.bodySmall
                )
            }
        }
    }
}