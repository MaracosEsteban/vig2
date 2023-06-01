package com.vigappm3.ui

import android.app.DatePickerDialog
import android.widget.DatePicker
import androidx.compose.foundation.Image
import androidx.compose.foundation.layout.Arrangement
import androidx.compose.foundation.layout.Box
import androidx.compose.foundation.layout.Column
import androidx.compose.foundation.layout.Row
import androidx.compose.foundation.layout.Spacer
import androidx.compose.foundation.layout.fillMaxSize
import androidx.compose.foundation.layout.fillMaxWidth
import androidx.compose.foundation.layout.height
import androidx.compose.foundation.layout.padding
import androidx.compose.foundation.layout.size
import androidx.compose.foundation.layout.widthIn
import androidx.compose.foundation.lazy.LazyColumn
import androidx.compose.foundation.lazy.items
import androidx.compose.material3.Button
import androidx.compose.material3.ButtonDefaults
import androidx.compose.material3.Card
import androidx.compose.material3.ExperimentalMaterial3Api
import androidx.compose.material3.MaterialTheme
import androidx.compose.material3.OutlinedTextField
import androidx.compose.material3.Text
import androidx.compose.runtime.Composable
import androidx.compose.runtime.mutableStateOf
import androidx.compose.runtime.remember
import androidx.compose.ui.Alignment
import androidx.compose.ui.Modifier
import androidx.compose.ui.graphics.Color
import androidx.compose.ui.platform.LocalContext
import androidx.compose.ui.res.painterResource
import androidx.compose.ui.res.stringResource
import androidx.compose.ui.text.font.FontWeight
import androidx.compose.ui.text.style.TextAlign
import androidx.compose.ui.unit.dp
import androidx.compose.ui.unit.sp
import com.vigappm3.R
//import com.vigappm3.Varios.cambiarFormatoFecha
import com.vigappm3.model.LecturasFiltradas
import com.vigappm3.ui.VigAppViewModel.GetLecturasFiltradasState
import com.vigappm3.varios.cambiarFormatoFecha
import java.util.Calendar
import java.util.Date


@Composable
fun RegistrosScreen(
    onHechoButtonClicked: () -> Unit,
    modifier: Modifier = Modifier.fillMaxSize(),
    viewM: VigAppViewModel,
) {
    var CurrentContext = LocalContext.current
    Column(
        verticalArrangement = Arrangement.Center,
        modifier = Modifier
            .fillMaxSize()
            .padding(16.dp)
    ) {







        Column(
            modifier = Modifier
                .weight(1.9f)
                .fillMaxSize(),
            verticalArrangement = Arrangement.Center,
            horizontalAlignment = Alignment.CenterHorizontally
        ) {
            Row(
                verticalAlignment = Alignment.CenterVertically,
                horizontalArrangement = Arrangement.Center
            ) {
                Text(text = stringResource(R.string.desde))
                Text(text = stringResource(R.string.desde))
                Button(onClick = { DatePickerDialog(CurrentContext).show() }) {
                    Text(text = stringResource(R.string.seleccionar))
                }
            }

            Spacer(modifier = Modifier.height(10.dp))
            Button(
                onClick = onHechoButtonClicked,
            ) {
                Text(stringResource(R.string.buscar))
            }
        }







        Column(modifier = Modifier.weight(7.5f)) {
            when (viewM.getLecturasFiltradasState) {
                is GetLecturasFiltradasState.Recuperando -> LoadingScreen(modifier)
                is GetLecturasFiltradasState.Success -> ResultScreen(
                    (viewM.getLecturasFiltradasState as GetLecturasFiltradasState.Success).resp[0].centros,
                    modifier
                )

                is GetLecturasFiltradasState.Error -> ErrorScreen(modifier)
            }
        }



        Column(
            modifier = Modifier
                .weight(0.6f)
                .fillMaxSize(),
            verticalArrangement = Arrangement.Center,
            horizontalAlignment = Alignment.CenterHorizontally
        ) {
            Button(
                onClick = onHechoButtonClicked,
                Modifier.widthIn(min = 200.dp)
            ) {
                Text(stringResource(R.string.hecho))
            }
        }
    }
}


@Composable
fun LoadingScreen(modifier: Modifier = Modifier) {
    Box(
        contentAlignment = Alignment.Center,
        modifier = modifier.fillMaxSize()
    ) {
        Image(
            modifier = Modifier.size(200.dp),
            painter = painterResource(R.drawable.loading_img),
            contentDescription = stringResource(R.string.loading)
        )
    }

}


@Composable
fun ResultScreen(listaConLec: List<LecturasFiltradas>, modifier: Modifier) {
    LazyColumn {
        // todo obtener la informacion de AppUiState

        items(listaConLec) { consLect ->
            TarjetaConsulta(consLect)
        }
    }
}


@Composable
fun ErrorScreen(modifier: Modifier = Modifier) {
    Box(
        contentAlignment = Alignment.Center,
        modifier = modifier.fillMaxSize()
    ) {
        Text(stringResource(R.string.loading_failed))
    }
}


@OptIn(ExperimentalMaterial3Api::class)
@Composable
fun TarjetaConsulta(
    lectura: LecturasFiltradas,
    modifier: Modifier = Modifier,
) {
    Card(
        modifier = Modifier
            .padding(8.dp)
            .fillMaxWidth()
    ) {

        Column(
            modifier = Modifier.align(Alignment.CenterHorizontally),
        ) {
            Row(horizontalArrangement = Arrangement.SpaceBetween) {
                Text(
                    fontSize = 15.sp,
                    fontWeight = FontWeight(700),
                    text = "Nombre Centro:  ",
                    modifier = Modifier.padding(3.dp),
                    style = MaterialTheme.typography.bodySmall
                )
                Text(
                    fontSize = 17.sp,
                    fontWeight = FontWeight(700),
                    text = lectura.NOMBRE_CENTRO,
                    modifier = Modifier.padding(1.dp),
                    style = MaterialTheme.typography.bodySmall
                )
            }

            Row(horizontalArrangement = Arrangement.SpaceBetween) {
                Text(
                    fontSize = 15.sp,
                    text = "Fecha y hora :  ",
                    modifier = Modifier.padding(1.dp),
                    style = MaterialTheme.typography.bodySmall
                )
                Text(
                    fontSize = 15.sp,
                  //  text = lectura.FHLOCAL,
                    text = cambiarFormatoFecha(lectura.FHLOCAL),
                    modifier = Modifier.padding(1.dp),
                    style = MaterialTheme.typography.bodySmall
                )
            }


            Row(horizontalArrangement = Arrangement.SpaceBetween) {
                Text(
                    fontSize = 15.sp,
                    text = "Latitud:  ",
                    modifier = Modifier.padding(1.dp),
                    style = MaterialTheme.typography.bodySmall
                )
                Text(
                    fontSize = 15.sp,
                    text = lectura.LATITUD,
                    modifier = Modifier.padding(1.dp),
                    style = MaterialTheme.typography.bodySmall
                )
            }


            Row(horizontalArrangement = Arrangement.SpaceBetween) {
                Text(
                    fontSize = 15.sp,
                    text = "Longitud:  ",
                    modifier = Modifier.padding(1.dp),
                    style = MaterialTheme.typography.bodySmall
                )
                Text(
                    fontSize = 15.sp,
                    text = lectura.LONGITUD,
                    modifier = Modifier.padding(1.dp),
                    style = MaterialTheme.typography.bodySmall
                )
            }


            OutlinedTextField(
                value = lectura.OBSERVACION,
                onValueChange = {},
                label =  { Text("Observaciones") },
                enabled = true,
                maxLines = 2,
                modifier = Modifier.padding(4.dp),
            )


        }
    }


    //https://www.geeksforgeeks.org/date-picker-in-android-using-jetpack-compose/
// Creating a composable function to
// create two Images and a spacer between them
// Calling this function as content
// in the above function
    @Composable
    fun MyDatePiker() {

        // Fetching the Local Context
        val mContext = LocalContext.current

        // Declaring integer values
        // for year, month and day
        val mYear: Int
        val mMonth: Int
        val mDay: Int

        // Initializing a Calendar
        val mCalendar = Calendar.getInstance()

        // Fetching current year, month and day
        mYear = mCalendar.get(Calendar.YEAR)
        mMonth = mCalendar.get(Calendar.MONTH)
        mDay = mCalendar.get(Calendar.DAY_OF_MONTH)

        mCalendar.time = Date()

        // Declaring a string value to
        // store date in string format
        val mDate = remember { mutableStateOf("") }

        // Declaring DatePickerDialog and setting
        // initial values as current values (present year, month and day)
        val mDatePickerDialog = DatePickerDialog(
            mContext,
            { _: DatePicker, mYear: Int, mMonth: Int, mDayOfMonth: Int ->
                mDate.value = "$mDayOfMonth/${mMonth + 1}/$mYear"
            }, mYear, mMonth, mDay
        )

        Column(
            modifier = Modifier.fillMaxSize(),
            verticalArrangement = Arrangement.Center,
            horizontalAlignment = Alignment.CenterHorizontally
        ) {

            // Creating a button that on
            // click displays/shows the DatePickerDialog
            Button(onClick = {
                mDatePickerDialog.show()
            }, colors = ButtonDefaults.buttonColors(containerColor = Color(0XFF0F9D58))) {
                Text(text = "Open Date Picker", color = Color.White)
            }

            // Adding a space of 100dp height
            Spacer(modifier = Modifier.size(100.dp))

            // Displaying the mDate value in the Text
            Text(
                text = "Selected Date: ${mDate.value}",
                fontSize = 30.sp,
                textAlign = TextAlign.Center
            )
        }
    }
}


/*
@Preview
@Composable
fun RegistrosPreview() {
    RegistrosScreen(
        onHechoButtonClicked = {},
        modifier = Modifier
            .padding(dimensionResource(R.dimen.padding_medium))
            .fillMaxSize()
    )
}
*/