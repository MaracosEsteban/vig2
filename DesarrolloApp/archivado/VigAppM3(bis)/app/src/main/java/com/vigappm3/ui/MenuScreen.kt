package com.vigappm3.ui


import androidx.compose.foundation.layout.*

import androidx.compose.material3.Button
import androidx.compose.material3.OutlinedButton
import androidx.compose.material3.Text
import androidx.compose.runtime.Composable
import androidx.compose.ui.Modifier
import androidx.compose.ui.res.dimensionResource
import androidx.compose.ui.res.stringResource
import androidx.compose.ui.tooling.preview.Preview
import com.vigappm3.R


@Composable
fun MenuScreen(
    onCenterCliked: () -> Unit,
    onCheckRecordsClicked: () -> Unit,
    onLogoutCliked:()->Unit,
    modifier: Modifier = Modifier
) {


    Column(
//                verticalArrangement = Arrangement.spacedBy(dimensionResource(R.dimen.padding_small))
        verticalArrangement = Arrangement.Center,
        modifier = Modifier.fillMaxSize()

    ) {


        Button(
            modifier = Modifier.fillMaxWidth()
                .wrapContentWidth(),
            onClick = { onCenterCliked() }
        ) {
            Text(stringResource(R.string.selec_center))
        }

        Spacer(modifier = Modifier.height(dimensionResource(R.dimen.padding_big)))



        Button(
            modifier = Modifier.fillMaxWidth()
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
            onClick = {onLogoutCliked()}
        ) {
            Text(stringResource(R.string.logout))
        }





    }
}



@Preview
@Composable
fun MenuScreenPreview() {
    MenuScreen(
        onCenterCliked = {},
        onCheckRecordsClicked = {},
        onLogoutCliked={},
        modifier = Modifier
            .padding(dimensionResource(R.dimen.padding_medium))
            .fillMaxSize()
    )
}
