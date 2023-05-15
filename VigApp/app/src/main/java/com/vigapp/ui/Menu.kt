package com.vigapp.ui


import androidx.compose.foundation.layout.*
import androidx.compose.material.Button
import androidx.compose.material.OutlinedButton
import androidx.compose.material.Text
import androidx.compose.runtime.Composable
import androidx.compose.ui.Modifier
import androidx.compose.ui.res.dimensionResource
import androidx.compose.ui.res.stringResource
import androidx.compose.ui.tooling.preview.Preview
import androidx.compose.ui.unit.dp
import com.vigapp.R


@Composable
fun MenuScreen(
    onCancelButtonClicked: () -> Unit,
    onSelecCenterClicked: () -> Unit,
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
            onClick = { onSelecCenterClicked() }
        ) {
            Text(stringResource(R.string.selec_center))
        }



        Button(
            modifier = Modifier.fillMaxWidth()
                .wrapContentWidth(),
            onClick = { onSelecCenterClicked() }
        ) {
            Text(stringResource(R.string.consultar_registros))
        }


        Spacer(modifier = Modifier.height(dimensionResource(R.dimen.padding_big)))

        OutlinedButton(
            modifier = Modifier
                .fillMaxWidth()
                .wrapContentWidth(),
            onClick = onCancelButtonClicked
        ) {
            Text(stringResource(R.string.logout))
        }





    }
}



@Preview
@Composable
fun MenuScreenPreview() {
    MenuScreen(
        onCancelButtonClicked = {},
        onSelecCenterClicked = {},
        modifier = Modifier
            .padding(dimensionResource(R.dimen.padding_medium))
            .fillMaxSize()
    )
}

