

class Cookie(
    val name: String,
    val softBaked: Boolean,
    val hasFilling: Boolean,
    val price: Double
) {
    override fun toString(): String {
        return "Cookie(name='$name', softBaked=$softBaked, hasFilling=$hasFilling, price=$price)"
    }
}

val cookies = listOf(
    Cookie(
        name = "Chocolate chip",
        softBaked = false,
        hasFilling = false,
        price = 1.69
    ),
    Cookie(
        name = "Banana Walnut",
        softBaked = true,
        hasFilling = false,
        price = 1.49
    ),
    Cookie(
        name = "Vanilla Creme",
        softBaked = false,
        hasFilling = true,
        price = 1.59
    ),
    Cookie(
        name = "Chocolate Peanut Butter",
        softBaked = false,
        hasFilling = true,
        price = 1.49
    ),
    Cookie(
        name = "Snickerdoodle",
        softBaked = true,
        hasFilling = false,
        price = 1.39
    ),
    Cookie(
        name = "Blueberry Tart",
        softBaked = true,
        hasFilling = true,
        price = 1.79
    ),
    Cookie(
        name = "Sugar and Sprinkles",
        softBaked = false,
        hasFilling = false,
        price = 1.39
    )
)


fun main(args: Array<String>) {
    // FOR EACH
    cookies.forEach { println("Menu Item  ${it.name}") }

    val fullMenu = cookies.map {
        "${it.name} - $${it.price}"
    }


    val fullMenu2 = cookies.map {
//        var name=it.name
        "hola"
    }


    val groupedMenu = cookies.groupBy { it.softBaked }

    cookies.forEach { println(it) }


    groupedMenu.get(true)?.forEach { println(it) }
    println()
    groupedMenu.get(false)?.forEach { println(it) }


    var totalPrice =cookies.fold(0.0)  {total, cookie ->
        total + cookie.price
    }


    println(totalPrice)





//    fullMenu2.forEach { println(it)
//    }







}