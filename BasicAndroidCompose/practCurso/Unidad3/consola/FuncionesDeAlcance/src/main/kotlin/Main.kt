


fun main(args: Array<String>) {
//    println("${Quiz.answered} of ${Quiz.total} answered.")
    // Quiz.StudentProgress.printProgressBar()
    Quiz().printProgressBar()   //Instancia de Quiz sin nombre
   // val quiz = Quiz()
   // quiz.printQuiz()

    val quiz = Quiz().apply {
        printQuiz()
    }
    quiz
}




interface ProgressPrintable {
    val progressText: String
    fun printProgressBar()
}




class Quiz : ProgressPrintable {
    val question1 = Question<String>("Quoth the raven ___", "nevermore", Difficulty.MEDIUM)
    val question2 = Question<Boolean>("The sky is green. True or false", false, Difficulty.EASY)
    val question3 = Question<Int>("How many days are there between full moons?", 28, Difficulty.HARD)

    companion object StudentProgress {
        var total: Int = 10
        var answered: Int = 3
    }



    override val progressText: String
        get() = "${answered} of ${total} answered"

    override fun printProgressBar() {
        repeat(Quiz.answered) { print("▓") }
        repeat(Quiz.total - Quiz.answered) { print("▒") }
        println()
        println(progressText)
    }

    fun printQuiz() {
        println(question1.questionText)
        println(question1.answer)
        println(question1.difficulty)
        println()
        println(question2.questionText)
        println(question2.answer)
        println(question2.difficulty)
        println()
        println(question3.questionText)
        println(question3.answer)
        println(question3.difficulty)
        println()
    }

//  defino una propiedad de extensión de Quiz.StudentProgress
//val Quiz.StudentProgress.progressText: String
//    get() = "${answered} of ${total} answered"

//
//fun Quiz.StudentProgress.printProgressBar() {
//    repeat(Quiz.answered) { print("▓") }
//    repeat(Quiz.total - Quiz.answered) { print("▒") }
//    println()
//    println(Quiz.progressText)
}





data class Question<T>(
    val questionText: String,
    var answer: T,
    val difficulty: Difficulty
)


enum class Difficulty {
    EASY, MEDIUM, HARD
}


object StudentProgress {                ///  objeto singleton
    var total: Int = 10
    var answered: Int = 3
}


// Estas clases no las uso

class FillInTheBlankQuestion(
    val questionText: String,
    val answer: String,
    val difficulty: String
)


class TrueOrFalseQuestion(
    val questionText: String,
    val answer: Boolean,
    val difficulty: String
)

class NumericQuestion(
    val questionText: String,
    val answer: Int,
    val difficulty: String
)











