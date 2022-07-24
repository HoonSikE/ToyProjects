package com.example.myapplications1

// 클래스 이름과 파일의 이름이 달라도 된다.
// 한 파일에 여러개의 클래스가 들어갈 수 있다.

// java처럼 생성자를 만들어주지않고 아래처럼 하면 자동으로 된다.
//class Human constructor(val name : String = "Anonymouse"){

// 상속 시 앞에 open을 써줘야한다!!!!!!
open class Human (val name : String = "Anonymouse"){

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

    // override 하려면 open 필요
    open fun singASong(){
        println("lalala")
    }
}

// 상속 (상속 받을 클래스에 open을 써줘야한다)
class Korean : Human(){
    // override 하려면 open 필요
    override fun singASong(){
        super.singASong()
        println("라라라")
        // Human 상속을 할떄 name에 "Anonymouse"를 Default값으로 주기 때문에 가능하다.
        println("my name is :${name}")
    }
}

fun main() {
    // new가 필요없다.
//    val human = Human()
    val human = Human("HanHoon")

    val stranger = Human()

    human.eatingCake()

    val human2 = Human("human2", 57)

    println("This human's name is ${human.name}")
    println("Stranger name is ${stranger.name}")

    // 여기부터 상속
    println("\n여기부터 상속")
    val korean = Korean()
    korean.singASong()
}