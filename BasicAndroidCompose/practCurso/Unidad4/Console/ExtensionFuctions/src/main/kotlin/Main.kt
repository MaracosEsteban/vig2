/**
 *
 * Probano extención de funciones en kotlin
 *
 */




fun main(args: Array<String>) {

    var list1= mutableListOf<Int>(5,6,7)

    var valores1=Valores(list1)

    println(valores1.Promedio2())
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
 *
 *
 *
 */


fun Valores.Promedio2():Int{
    var total=0
    return numeros.average().toInt()
}





