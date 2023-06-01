import java.time.LocalDate
import java.time.LocalDateTime
import java.time.format.DateTimeFormatter
import javax.swing.text.DateFormatter


fun main(args: Array<String>) {

    // imprimir hora actual

    val ahora=LocalDateTime.now()
    val formatter3 = DateTimeFormatter.ofPattern("d MMMM yyyy, HH:MM")
    //println(ahora.format(formatter3))




//dfsdfsd
    //imprimir datetime en un formato determinado---------------------------------------------
    val formatter1 = DateTimeFormatter.ofPattern("d MMMM yyyy, HH:mm")
    val date1: LocalDateTime = LocalDateTime.now()
    //println(date1.format(formatter1))


    //transformar string a dateTime----------------------------------------------------------

    val dateString: String = "2023-05-31 16:32:34"
    val formatter2 = DateTimeFormatter.ofPattern("yyyy-MM-dd HH:mm:ss")
    val date2 = LocalDateTime.parse(dateString, formatter2)
   // println(date2.format(formatter1))


//    val parsedDate = LocalDate.parse(text, formatter)

   //println(cambiarFormatoFecha("0001-01-01 00:00:00"))




    // el probema consiste en que
    // recibo una cadena de caracteres tipo   "01-06-2023"
    // y tengo de devolver dia mes año por separado


    var miFecha=LocalDate.now()

    val formatoFecha = DateTimeFormatter.ofPattern("dd-MM-yyyy")
    var fechaString=miFecha.format(formatoFecha)

   // println(LocalDate.of(2023, 11, 30).format(formatoFecha).toString())



    var MF=LocalDate.parse( "01-08-2029",formatoFecha)
    println(MF.dayOfMonth)
    println(MF.monthValue)
    println(MF.year)



    var recom =LocalDate.of(MF.year,MF.monthValue,MF.dayOfMonth)









}



/**
 * Esta funcion toma un string en el formato que es´guardado
 * en la BBDD "yyyy-MM-dd HH:mm:ss" y lo devuelve en formato
 * que se puede mostrar en la App "d MMMM yyyy, hh:mm"
 * ante cualquier error devuelve
 */



fun cambiarFormatoFecha( dateStringInput: String = "0001-01-01 00:00:00"):String {
    var dateStringOutput ="1 enero 0001, 00:00"
    val formatter2 = DateTimeFormatter.ofPattern("yyyy-MM-dd HH:mm:ss") // => formato de entrada
    val formatter1 = DateTimeFormatter.ofPattern("d MMMM yyyy, HH:mm")  // => formato de salida
    try {
        val auxDate = LocalDateTime.parse(dateStringInput, formatter2)
        dateStringOutput=auxDate.format(formatter1).toString()
    } catch (e:Exception){
        //No hace nada devuelve la fecha por defecto
    }
    return dateStringOutput
}




