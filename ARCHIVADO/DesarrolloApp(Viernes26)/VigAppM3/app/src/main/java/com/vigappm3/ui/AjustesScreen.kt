package com.vigappm3.ui

import androidx.compose.foundation.layout.Arrangement
import androidx.compose.foundation.layout.Column
import androidx.compose.foundation.layout.fillMaxSize
import androidx.compose.foundation.layout.padding
import androidx.compose.foundation.layout.widthIn

import androidx.compose.material3.Button
import androidx.compose.material3.Text
import androidx.compose.runtime.Composable
import androidx.compose.ui.Alignment
import androidx.compose.ui.Modifier
import androidx.compose.ui.res.dimensionResource
import androidx.compose.ui.res.stringResource
import androidx.compose.ui.tooling.preview.Preview
import androidx.compose.ui.unit.dp

import com.vigappm3.R


@Composable
fun AjustesScreen(
    onVolverButtonClicked: () -> Unit,
    modifier: Modifier = Modifier.fillMaxSize()
) {
    Column(
        modifier = modifier,
        horizontalAlignment = Alignment.CenterHorizontally,
        verticalArrangement = Arrangement.Center
    ) {
        Button(
            onClick = onVolverButtonClicked,
            Modifier.widthIn(min = 250.dp)
        ) {
            Text(stringResource(R.string.volver))
        }
    }
}



@Preview
@Composable
fun AjustesPreview(){
    AjustesScreen(
        onVolverButtonClicked = {},
        modifier = Modifier
            .padding(dimensionResource(R.dimen.padding_medium))
            .fillMaxSize()
    )
}
