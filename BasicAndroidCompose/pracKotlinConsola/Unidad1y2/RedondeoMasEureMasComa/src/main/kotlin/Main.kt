import java.text.NumberFormat

fun main(args: Array<String>) {

    var tip:Double=45.25
    println(tip)


    tip = kotlin.math.ceil(tip)
    // aplica redondeo
    println(tip)


    val tipString = NumberFormat.getCurrencyInstance().format(tip).toString()
    // Le agrega el euro, cambia el punto por la coma

    println(tipString)



}







