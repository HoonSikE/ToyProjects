package com.example.myapplications1

// 클래스 이름과 파일의 이름이 달라도 된다.
// 한 파일에 여러개의 클래스가 들어갈 수 있다.

// java처럼 생성자를 만들어주지않고 아래처럼 하면 자동으로 된다.
//class Human constructor(val name : String = "Anonymouse"){
class Human (val name : String = "Anonymouse"){

    // constructor(부생성자는 항상 주생성자의 위임을 받아야한다. -> this)
    constructor(name : String, age : Int) : this(name){
        println("my name is ${name}, ${age} years old")
    }

    // 생성시에 동작하는 함수
    init{
        println("New human has been born!!")
    }

    //    val name = "HanHoon" // 위에 val로 선언을 해준다면 클래스 내부에 선언 불필요
    fun eatingCake(){
        println("This is so YUMMYYYY~~~~")
    }
}

fun main() {
    // new가 필요없다.
//    val human = Human()
    val human = Human("HanHoon")

    val stranger = Human()

    human.eatingCake()

    println("This human's name is ${human.name}")
    println("Stranger name is ${stranger.name}")
}