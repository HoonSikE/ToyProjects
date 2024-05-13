package com.example.myapplication2

// 1. Lamda
// 람다식은 우리가 마치 value 처럼 다룰 수 있는 익명함수이다.
// 1) 메소드의 파라미터로 넘겨줄수가 있다. fun maxBy(a :Int)
// 2) return 값으로 사용할 수가 있다.

// 람다의 기본정의
// val lamdaName : Type = {argumentList -> codeBody}

//val square : (Int) -> (Int) = {number -> number*number}
val square = {number : Int -> number*number}

val nameAge = {name : String, age : Int ->
    "my name ${name}, I'm ${age}"
}

fun main() {
    println(square(5))
    println(nameAge("HanHoon", 27))

    val a = "Han said"
    val b = "Hoon said"

    println(a.pizzaIsGreat())
    println(b.pizzaIsGreat())

    println(extendString("ariana", 27))
    println(calculateGrade(97))
    println(calculateGrade(999))


    // 여기부터 람다
    println()
    val lamda = { number: Double ->
        number == 4.3213
    }

    println(invokeLamda(lamda))
    println(invokeLamda({true}))

    println(invokeLamda({it >3.22}))
    println(invokeLamda() { it > 3.22 })
    println(invokeLamda { it > 3.22 })
}

// 확장함수
val pizzaIsGreat : String.() -> String = {
    this + " Pizza is the best!"
}

fun extendString(name : String, age : Int) : String {
    // 파라미터가 .(Int) 처럼 1개일때는 ${it}으로 사용가능
    val introduceMyself : String.(Int) -> String = {"I am ${this} and ${it} years old"}
    return name.introduceMyself(age)
}

// 람다의 Return

// Input Type은 값이 여러개일 수도 있기때문에 괄호가 필수이다. But, Ouput Type은 하나만 존재하기 때문에 괄호 생략 가능
val calculateGrade : (Int) -> String = {
    when(it){
        in 0..40 -> "faul"
        in 41..70 -> "pass"
        in 71..100 -> "perfect"
        else -> "Error"
    }
}

// 람다를 표현하는 여러가지 방법

fun invokeLamda(lamda : (Double) -> Boolean) : Boolean{
    return lamda(5.2343)
}

// pojo 클래스 (특정 행동을 하는 class라고 하기보다는 비어있는 틀 역할을 하는 클래스)