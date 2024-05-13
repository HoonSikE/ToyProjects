package com.example.myapplication2

// Kotlin
data class Ticket(val companyName : String, val name : String, var date : String, var seatNumber : Int)
// toString(), hashCode(), equals(), copy()

// Java
class TicketNormal(val companyName : String, val name : String, var date : String, var seatNumber : Int)

fun main(){
    // Kotlin
    val ticketA = Ticket("koreanAir", "HanHoon", "2021-07-25", 7)
    // Java
    val ticketB = TicketNormal("koreanAir", "HanHoon", "2021-07-25", 7)

    // Kotlin : data 출력
    println(ticketA)
    // Java : 주소값 출력
    println(ticketB)
}