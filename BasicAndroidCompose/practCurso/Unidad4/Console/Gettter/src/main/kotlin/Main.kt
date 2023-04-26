import java.lang.reflect.Array.get


fun main(args: Array<String>) {
    val al1=Alumno()

    println(al1.nombre)


    val ape="cuadrdo"


    val apeTemp=ape.toCharArray()

    apeTemp.shuffle()

    println(String(apeTemp))






}




class Alumno() {
    private var _nombre: String = "Esteban"

    val nombre: String
        get() = _nombre+"222222"

}








