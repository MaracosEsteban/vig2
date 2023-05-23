package com.vigappm3.ui

import androidx.compose.foundation.layout.Arrangement
import androidx.compose.foundation.layout.Box
import androidx.compose.foundation.layout.Column
import androidx.compose.foundation.layout.Spacer
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
import androidx.compose.ui.Alignment
import androidx.compose.ui.Modifier
import androidx.compose.ui.text.AnnotatedString
import androidx.compose.ui.text.TextStyle
import androidx.compose.ui.text.input.KeyboardType
import androidx.compose.ui.text.input.PasswordVisualTransformation
import androidx.compose.ui.unit.dp
import androidx.compose.ui.unit.sp
import androidx.compose.ui.res.stringResource
import com.vigappm3.R



@OptIn(ExperimentalMaterial3Api::class)
@Composable
fun LoginScreen(
    onNameChange: (String) -> Unit,
    nameEntered:String,
    onPasswordChange:(String) -> Unit,
    passwordEntered:String,
    onLoginButtonClicked: () -> Unit,
    modifier: Modifier,
    ) {

    Column(
        modifier = modifier,
        verticalArrangement = Arrangement.Center,
        horizontalAlignment = Alignment.CenterHorizontally
    ) {

        Spacer(modifier = Modifier.height(40.dp))

        TextField(
            label = { Text(stringResource(R.string.user_name)) },
            value = nameEntered,
            onValueChange = onNameChange)

        Spacer(modifier = Modifier.height(20.dp))

        TextField(
            singleLine = true,
            label={ Text(stringResource(R.string.password))},
            value = passwordEntered,
            visualTransformation = PasswordVisualTransformation(),
            keyboardOptions = KeyboardOptions(keyboardType = KeyboardType.Password),
            onValueChange =  onPasswordChange)

        Spacer(modifier = Modifier.height(20.dp))

        Box(modifier = Modifier.padding(40.dp, 0.dp, 40.dp, 0.dp)) {
            Button(
                onClick = { onLoginButtonClicked() },
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






//@Preview
//@Composable
//fun LoginPreview(){
//    LoginScreen(
//        onLoginButtonClicked= {},
//        onPasswordChange = {},
//    )
//}
