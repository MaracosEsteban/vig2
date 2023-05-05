
/**
 * pruebo pasar una funcion com parametro
 */


fun main(args: Array<String>) {
    var funcion1 = { x:Int->x*2} //funcion para pasar como parámetro
    var funcion2 = { x:Int->x*3} //funcion para pasar como parámetro
    println(comp(2,funcion1))// resultado esperado => 6
    println(comp(2,funcion2))// resultdo esperado  => 8
}




fun comp(valor:Int,funcion:(Int)->Int):Int{
    var funAux=funcion
    return funAux(2)+valor
}




