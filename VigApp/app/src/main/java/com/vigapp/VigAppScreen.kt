package com.vigapp

import androidx.annotation.StringRes
import androidx.compose.material.Icon
import androidx.compose.material.IconButton
import androidx.compose.material.Text
import androidx.compose.material.TopAppBar
import androidx.compose.material.icons.Icons
import androidx.compose.material.icons.filled.ArrowBack
import androidx.compose.runtime.Composable
import androidx.compose.runtime.getValue
import androidx.compose.ui.Modifier
import androidx.compose.ui.res.stringResource
import androidx.compose.ui.tooling.preview.Preview
import androidx.lifecycle.viewmodel.compose.viewModel
import com.vigapp.ui.LoginScreen
import androidx.navigation.compose.currentBackStackEntryAsState
import androidx.navigation.compose.rememberNavController


enum class VigAppScreen(@StringRes val title: Int) {
    Login(title = R.string.login_inst),
    Menu(title = R.string.menu_inst),
    SelecCentro(title = R.string.selec_centro_inst),
    Fichar(title = R.string.fichar_inst),
    //Todo falta faltan pantalla confuguaración y mostrar registros
}





/**
 * Composable that displays the topBar and displays back button if back navigation is possible.
 */
@Composable
fun LunchTrayAppBar(
    @StringRes currentScreenTitle: Int,
    canNavigateBack: Boolean,
    navigateUp: () -> Unit,
    modifier: Modifier = Modifier
) {
    TopAppBar(
        title = { Text(stringResource(currentScreenTitle)) },
        modifier = modifier,
        navigationIcon = {
            if (canNavigateBack) {
                IconButton(onClick = navigateUp) {
                    Icon(
                        imageVector = Icons.Filled.ArrowBack,
                        contentDescription = stringResource(R.string.volver_atras)
                    )
                }
            }
        }
    )
}












@Composable
fun VigApp() {
    //Create NavController
    val navController = rememberNavController()
    // Get current back stack entry
    val backStackEntry by navController.currentBackStackEntryAsState()
    // Get the name of the current screen
    val currentScreen = VigAppScreen.valueOf(
        backStackEntry?.destination?.route ?: VigAppScreen.Login.name    )
    // Create ViewModel
    val viewModel: OrderViewModel = viewModel()











//    LoginScreen(onStartOrderButtonClicked = { /*TODO*/ })
}






@Preview
@Composable
fun VigAppPreview() {
    VigApp()
}

