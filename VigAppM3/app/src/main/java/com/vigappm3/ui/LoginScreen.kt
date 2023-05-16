package com.vigappm3.ui


import androidx.compose.foundation.layout.Arrangement
import androidx.compose.foundation.layout.Box
import androidx.compose.foundation.layout.Column
import androidx.compose.foundation.layout.Spacer
import androidx.compose.foundation.layout.fillMaxSize
import androidx.compose.foundation.layout.fillMaxWidth
import androidx.compose.foundation.layout.height
import androidx.compose.foundation.layout.padding
import androidx.compose.foundation.shape.RoundedCornerShape
import androidx.compose.foundation.text.ClickableText
import androidx.compose.foundation.text.KeyboardOptions
import androidx.compose.material3.Button
import androidx.compose.material3.ExperimentalMaterial3Api
import androidx.compose.material3.Text
import androidx.compose.material3.TextField
import androidx.compose.runtime.Composable
import androidx.compose.runtime.mutableStateOf
import androidx.compose.runtime.remember
import androidx.compose.ui.Alignment
import androidx.compose.ui.Modifier
import androidx.compose.ui.text.AnnotatedString
import androidx.compose.ui.text.TextStyle
import androidx.compose.ui.text.input.KeyboardType
import androidx.compose.ui.text.input.PasswordVisualTransformation
import androidx.compose.ui.text.input.TextFieldValue
import androidx.compose.ui.text.style.TextDecoration
import androidx.compose.ui.unit.dp
import androidx.compose.ui.unit.sp
import androidx.lifecycle.viewmodel.compose.viewModel
import com.vigappm3.ui.theme.Purple80


@OptIn(ExperimentalMaterial3Api::class)
@Composable
fun LoginScreen(
    onLoginButtonClicked: () -> Unit,
    modifier: Modifier = Modifier.fillMaxSize(),
    appViewModel:VigAppViewModel = viewModel()

) {

    Column(
        modifier = Modifier.padding(20.dp),
        verticalArrangement = Arrangement.Center,
        horizontalAlignment = Alignment.CenterHorizontally
    ) {

        val username = remember { mutableStateOf(TextFieldValue()) }
        val password = remember { mutableStateOf(TextFieldValue()) }



        Spacer(modifier = Modifier.height(40.dp))

        TextField(
            label = { Text(text = "Username") },
            value = username.value,
            onValueChange = { username.value = it })

        Spacer(modifier = Modifier.height(20.dp))


        TextField(

            label = { Text(text = "Password") },
            value = appViewModel.enteredPassword,
            visualTransformation = PasswordVisualTransformation(),
            keyboardOptions = KeyboardOptions(keyboardType = KeyboardType.Password),
            onValueChange = { password.value = it })

        //  onUserGuessChanged = { gameViewModel.updateUserGuess(it) },
        Spacer(modifier = Modifier.height(20.dp))


        Box(modifier = Modifier.padding(40.dp, 0.dp, 40.dp, 0.dp)) {
            Button(
                onClick = {onLoginButtonClicked() },
                shape = RoundedCornerShape(50.dp),
                modifier = Modifier
                    .fillMaxWidth()
                    .height(50.dp)
            ) {
                Text(text = "Login")
            }
        }

        Spacer(modifier = Modifier.height(20.dp))
        ClickableText(
            text = AnnotatedString("Forgot password?"),
            onClick = { },
            style = TextStyle(
                fontSize = 14.sp,
//                fontFamily = FontFamily.Default
            )
        )
    }
}


//@Composable
//fun LoginScreen(
//    onStartOrderButtonClicked: () -> Unit,
//    modifier: Modifier = Modifier.fillMaxSize()
//) {
//    Column(
//        modifier = modifier,
//        horizontalAlignment = Alignment.CenterHorizontally,
//        verticalArrangement = Arrangement.Center
//    ) {
//        Button(
//            onClick = onStartOrderButtonClicked,
//            Modifier.widthIn(min = 250.dp)
//        ) {
//            Text(stringResource(R.string.log_in))
//        }
//    }
//}


//@Preview
//@Composable
//fun LoginPreview(){
//    LoginScreen(
//        onStartOrderButtonClicked = {},
//        modifier = Modifier
//            .padding(dimensionResource(R.dimen.padding_medium))
//            .fillMaxSize()
//    )
//}
