fun main(args: Array<String>) {

   var sumRes=sumarRestar(false)

    println(sumRes(6,3))


}


var sumar: (Int, Int) -> Int = { a, b -> a + b }


fun sumarRestar(operacion: Boolean): (Int, Int) -> Int {


    var sumar: (Int, Int) -> Int = { a, b -> a + b }

    var restar: (Int, Int) -> Int = { a, b -> a - b }

    return if (operacion) {
        sumar
    } else {
        restar
    }
}




