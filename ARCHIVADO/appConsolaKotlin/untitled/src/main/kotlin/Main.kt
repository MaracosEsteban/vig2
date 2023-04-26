import java.util.*


data class alumno(var nombre: String, var edad: Int) {


}


fun main(args: Array<String>) {

    var alumnos = mutableListOf<alumno>()


    println("Hello World!")
    val reader = Scanner(System.`in`)


    print("Ingrese el nombre  ")
    val nombre: String = reader.next()



    print("Ingrese la edad   ")
    val edad: Int = reader.nextInt()




    println("La edad ingresada es  $edad")
    println("El nombre ingresado es $nombre")

    alumnos.add(alumno(nombre, edad))


    // println("Program arguments: ${args.joinToString()}")
}