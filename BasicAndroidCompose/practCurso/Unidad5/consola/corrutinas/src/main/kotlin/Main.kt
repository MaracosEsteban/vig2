





fun main(args: Array<String>) {

    //var marsUiState:MarsUiState=MarsUiState().Success("la foto")
    var marsUiState: UiState = UiState.Loading()



    println(marsUiState)







}


sealed interface UiState {
    data class Success(val SucMessaje: String="Carga exitosa") : UiState
    data class Error(val ErrMessaje: String="Error al intentar cargar las fotos") : UiState
    data class Loading(val LoadMessage: String="Cargando fotos......") : UiState

}







fun UiStates(uiState: UiState) = when(uiState) {
    is UiState.Loading -> println(uiState.LoadMessage)
    is UiState.Success -> println(uiState.SucMessaje)
    is UiState.Error -> println(uiState.ErrMessaje)
}




//https://kotlinlang.org/docs/sealed-classes.html

