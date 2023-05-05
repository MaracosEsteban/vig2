/**
 *
 * Probano extención de funciones en kotlin
 *
 */




fun main(args: Array<String>) {
    var list1= mutableListOf<Int>(5,6,7)
    var valores1=Valores(list1)
    println(valores1.Promedio())
    println(valores1.sumar())


}



  class Valores(var numeros:MutableList<Int>){
    fun sumar( ):Int{
        var suma=0
         numeros.forEach({it->suma=suma+it})
        return suma

    }



}




/**
 * Aqui extiendo la clase Valores agregandole la funcion Promedio
 */
fun Valores.Promedio():Int{
    var total=0
    return numeros.average().toInt()

}

/**
 * According to the theory of extension functions, this is not possible since you can only add the extension functions but not properties, but there is a workaround which can solve the purpose.
 *    https://agrawalsuneet.github.io/blogs/kotlin-extension-property/
 *
 *
 *
 */







