package com.vigappm3.ui


import androidx.compose.foundation.layout.*
import androidx.compose.foundation.lazy.LazyColumn

import androidx.compose.material3.Button
import androidx.compose.material3.ExperimentalMaterial3Api
import androidx.compose.material3.OutlinedButton
import androidx.compose.material3.Scaffold
import androidx.compose.material3.Text
import androidx.compose.runtime.Composable
import androidx.compose.ui.Alignment
import androidx.compose.ui.Modifier
import androidx.compose.ui.res.dimensionResource
import androidx.compose.ui.res.stringResource
import androidx.compose.ui.tooling.preview.Preview
import androidx.compose.ui.unit.dp
import com.vigappm3.R


@OptIn(ExperimentalMaterial3Api::class)
@Composable
fun MenuScreen(
    onCenterCliked: () -> Unit,
    onCheckRecordsClicked: () -> Unit,
    onLogoutCliked: () -> Unit,
    modifier: Modifier = Modifier
) {


    Column(
//                verticalArrangement = Arrangement.spacedBy(dimensionResource(R.dimen.padding_small))
        verticalArrangement = Arrangement.Center,
        modifier = Modifier.fillMaxSize()

    ) {


        Scaffold(bottomBar = {
            //Scaffold(topBar = {
            Row(
                horizontalArrangement = Arrangement.SpaceAround,
                modifier = Modifier
                    .fillMaxWidth()

            ) {


                Button(
                    onClick = {


                    },
                    // modifier = Modifier.padding(8.dp)
                ) {
                    Text(text = "Ajustes")
                }


            }
        }) {


            Column(
                modifier = Modifier
                    .padding(32.dp)
                    .fillMaxSize(),
                verticalArrangement = Arrangement.SpaceAround,
                horizontalAlignment = Alignment.CenterHorizontally
            ) {

                Button(
                    modifier = Modifier
                        .fillMaxWidth()
                        .wrapContentWidth(),
                    onClick = { onCenterCliked() }
                ) {
                    Text(stringResource(R.string.selec_center))
                }

                Spacer(modifier = Modifier.height(dimensionResource(R.dimen.padding_big)))

                Button(
                    modifier = Modifier
                        .fillMaxWidth()
                        .wrapContentWidth(),
                    onClick = { onCheckRecordsClicked() }
                ) {
                    Text(stringResource(R.string.consultar_registros))
                }

                Spacer(modifier = Modifier.height(dimensionResource(R.dimen.padding_big)))
                Spacer(modifier = Modifier.height(dimensionResource(R.dimen.padding_big)))

                OutlinedButton(
                    modifier = Modifier
                        .fillMaxWidth()
                        .wrapContentWidth(),
                    onClick = { onLogoutCliked() }
                ) {
                    Text(stringResource(R.string.logout))
                }
            }
        }


    }
}


@Preview
@Composable
fun MenuScreenPreview() {
    MenuScreen(
        onCenterCliked = {},
        onCheckRecordsClicked = {},
        onLogoutCliked = {},
        modifier = Modifier
            .padding(dimensionResource(R.dimen.padding_medium))
            .fillMaxSize()
    )
}
