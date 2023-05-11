/**
 * El operador :: crea una referencia de miembro o un referencia de clase
 *
 * https://kotlinlang.org/docs/reflection.html#function-references
 * https://kotlinlang.org/docs/reflection.html#bound-class-references
 *
 *
 *
 */

fun main(args: Array<String>) {


val numbers = listOf(1,2,3,4,5)
    println(numbers.filter(::isOdd )) // refers to isOdd(x: Int)

    var myClass=MyClass(5)


    val c = myClass::class

    println(c)


}

fun isOdd(x: Int) = (x % 2) != 0


data class MyClass(val num:Int )





