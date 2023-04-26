


enum class Daypar {
    morning, afternoon, evening, night, daytime
}


data class Event(val title: String, var description: String?, val dayPar: Daypar, var durationInMinutes: Int)

val Event.durationOfEvent: String
    get() = if (this.durationInMinutes < 60) {
        "short"
    } else {
        "long"
    }









fun main(args: Array<String>) {

    val events= mutableListOf<Event>()


    events.add(Event("Study Kotlin","Commit to studying Kotlin at least 15 minutes per day",Daypar.evening,15))
    events.add(Event("Study Kotlin","Commit to studying Kotlin at least 15 minutes per day",Daypar.evening,40))
    events.add(Event("Study Kotlin","Commit to studying Kotlin at least 15 minutes per day",Daypar.evening,4))
    events.add(Event("Study Kotlin","Commit to studying Kotlin at least 15 minutes per day",Daypar.evening,120))



    val shortEvents = events.filter { it.durationInMinutes < 60 }




    events.forEach { println(it) }
    shortEvents.forEach { println(it) }

//
//    Your teammates like how the app is coming along, but they want users to be able to see a summary of all the events and their daypart.
//
//    The output should be similar to:
//
//
//    Morning: 3 events
//    Afternoon: 4 events
//    Evening: 2 events

    val groupedEvents = events.groupBy { it.dayPar }
    groupedEvents.forEach { (daypart, events) ->
        println("$daypart: ${events.size} events")
    }


    events.forEach{ println(it.durationOfEvent) }



}























