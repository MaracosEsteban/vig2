@file:OptIn(ExperimentalMaterial3Api::class)

package com.vigappm3

import android.widget.Toast
import androidx.annotation.StringRes
import androidx.compose.foundation.layout.fillMaxSize
import androidx.compose.foundation.layout.padding
import androidx.compose.material.*
import androidx.compose.material.icons.Icons
import androidx.compose.material.icons.filled.ArrowBack
import androidx.compose.material3.CenterAlignedTopAppBar
import androidx.compose.material3.ExperimentalMaterial3Api
import androidx.compose.material3.Icon
import androidx.compose.material3.IconButton
import androidx.compose.material3.Scaffold
import androidx.compose.material3.Text
import androidx.compose.runtime.Composable
import androidx.compose.runtime.LaunchedEffect
import androidx.compose.runtime.collectAsState
import androidx.compose.runtime.getValue
import androidx.compose.ui.Modifier
import androidx.compose.ui.res.dimensionResource
import androidx.compose.ui.res.stringResource
import androidx.compose.ui.tooling.preview.Preview
import androidx.lifecycle.viewmodel.compose.viewModel
import androidx.navigation.compose.NavHost
import androidx.navigation.compose.composable
import androidx.navigation.compose.currentBackStackEntryAsState
import androidx.navigation.compose.rememberNavController
import com.vigappm3.ui.*
import kotlinx.coroutines.Dispatchers
import kotlinx.coroutines.GlobalScope
import kotlinx.coroutines.launch
import kotlinx.coroutines.withContext
import com.vigappm3.ui.LoginScreen

enum class VigAppScreen(@StringRes val title: Int) {
    Login(title = R.string.login_inst),
    Menu(title = R.string.menu_inst),
    SelecCentro(title = R.string.selec_centro_inst),
    Fichar(title = R.string.fichar_inst),
    Ajustes(title = R.string.ajustes),
    Registros(title = R.string.registros)
}


/**
 * Composable that displays the topBar and displays back button if back navigation is possible.
 */
@ExperimentalMaterial3Api
@Composable
fun VigAppBar(
    @StringRes currentScreenTitle: Int,
    canNavigateBack: Boolean,
    navigateUp: () -> Unit,
    modifier: Modifier = Modifier
) {
    CenterAlignedTopAppBar(
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
        backStackEntry?.destination?.route ?: VigAppScreen.Login.name
    )
    // Create ViewModel
    val viewModel: VigAppViewModel = viewModel()

    Scaffold(
        topBar = {
            VigAppBar(
                currentScreenTitle = currentScreen.title,
                canNavigateBack = navController.previousBackStackEntry != null,
                navigateUp = {
                    viewModel.logout()
                    navController.navigateUp()
                }
            )
        }
    ) { innerPadding ->
        val uiState by viewModel.uiState.collectAsState()

        NavHost(
            navController = navController,
            startDestination = VigAppScreen.Login.name,
            modifier = Modifier.padding(innerPadding),
        ) {


            composable(route = VigAppScreen.Login.name) {
                LoginScreen(
                    passwordEntered = viewModel.enteredPassword,
                    onPasswordChange = { viewModel.updateEnteredPass(it) },

                    nameEntered = viewModel.enteredName,
                    onNameChange = { viewModel.updateEnteredName(it) },

                    onLoginButtonClicked = {

                        if (viewModel.login()) {
                            navController.navigate(VigAppScreen.Menu.name)
                        } else {
                            // todo Toast.makeText(this@LoginScreen, "hola", Toast.LENGTH_SHORT).show()
                        }


//                        GlobalScope.launch(Dispatchers.Main) {
//                            withContext(Dispatchers.IO) {
//                                viewModel.getListaUsuarios()
//                            }
//
//                            if (viewModel.login()) {
//                                navController.navigate(VigAppScreen.Menu.name)
//                            }
//                        }

                    },

                    modifier = Modifier
                        .fillMaxSize()
                        .padding(
                            dimensionResource(R.dimen.padding_medium),
                        ),
                )
            }



            composable(route = VigAppScreen.Menu.name) {
                MenuScreen(
                    onCenterCliked = {
                      //  viewModel.getListaCentrosToUiState()
                        navController.navigate(VigAppScreen.SelecCentro.name)
                    },
                    onCheckRecordsClicked = { navController.navigate(VigAppScreen.Registros.name) },
                    onLogoutCliked = {
                        viewModel.logout()
                        navController.popBackStack(
                            VigAppScreen.Login.name,
                            inclusive = false
                        )
                    },// todo
                    modifier = Modifier
                        .padding(dimensionResource(R.dimen.padding_medium))
                        .fillMaxSize()
                )
            }




            composable(route = VigAppScreen.SelecCentro.name) {
                SelecCentroScreen(
                    viewM = viewModel,
                    onCancelButtonClicked = {
                       // viewModel.logout()
                        navController.popBackStack(
                            VigAppScreen.Menu.name,
                            inclusive = false
                        )
                    },
                    onSelecCenterClicked = { navController.navigate(VigAppScreen.Fichar.name) })

            }



            composable(route = VigAppScreen.Fichar.name) {
                FicharScreen(
                    onFichartButtonClicked = {
                        navController.popBackStack(
                            VigAppScreen.Menu.name,
                            inclusive = false
                        )
                    },
                    onCancelButtonClicked = {
                        viewModel.logout()
                        navController.popBackStack(
                            VigAppScreen.Menu.name,
                            inclusive = false
                        )
                    })
            }



            composable(route = VigAppScreen.Registros.name) {
                RegistrosScreen(onHechoButtonClicked = {
                    navController.popBackStack(
                        VigAppScreen.Menu.name,
                        inclusive = false
                    )
                })
            }



            composable(route = VigAppScreen.Ajustes.name) {
            }


        }
    }


}


@Preview
@Composable
fun VigAppPreview() {
    VigApp()
}

