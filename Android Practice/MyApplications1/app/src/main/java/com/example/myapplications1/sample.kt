package com.example.myapplications1

fun main(){
    helloWorld()
    println(add(4, 5))
    // 3. String Template
    var name = "HanHoon"
    var lastName = "Park"
    println("My name is ${name + lastName}. I'm 27")

    checkNum(1)

    forAndWhile()

    nullcheck()

    ignoreNulls("hihi")
}

//1. 함수
// Unit -> void와 비슷한 의미 (회색부분은 안써도 된다는 의미
fun helloWorld() : Unit {
    println("Hello World")
}

fun add(a : Int, b : Int) : Int{
    return a+b
}

// 2. val vs var
// val = value

fun hi(){
    // 변하지 않는 상수
    val a : Int = 10
    // 변하는 값 (변수)
    var b : Int = 9
    // a = 100 --> 오류
    b = 100
    val c = 100 // Int 생략 가능
    var d = 200

    var name = "HanHoon"    // String 생략 가능
}

// 4. 조건식
fun maxBy(a:Int, b:Int) :Int{
    if(a>b){
        return a
    }else{
        return b
    }
}

// 삼항연산자가 없다.
fun maxBy2(a:Int, b:Int) = if(a>b) a else b

// switch를 대신해서 사용
fun checkNum(score : Int){
    when(score){
        0 -> println("this is 0")
        1 -> println("this is 1")
        2 -> println("this is 2 or 3")
        // else가 필수는 아니다.
        else -> println("I don't know")
    }
    var b = when(score){
        1->1
        2->2
        // 마지막에 else가 필수이다.
        else -> 3
    }

    println("b : ${b}")

    when(score){
        in 90..100 -> println("You are genius")
        in 10..80 -> println("not bad")
        else -> println("okay")
    }
}

// 5. Array and List
// 5-1 Array : 가변
// 5-2 List : 고정(읽기전용)
// 5-3 MutableList : 가변
fun array(){
    val array = arrayOf(1,2,3)
    val list = listOf(1,2,3)

    val arry2 = arrayOf(1, "d", 3.4f)
    val list2 = listOf(1, "d", 11L)

    array[0] = 3
    var result = list.get(0)

    val arrayList = arrayListOf<Int>()
    arrayList.add(10)
    arrayList.add(20) // lista listb
}

// 6. For / While

fun forAndWhile(){
    val students = arrayListOf("loyce", "james", "jenny", "jennifer")
    for ( name in students){
        println("${name}")
    }

    // index와 name을 함께 사용하고 싶을때
    for((index, name) in students.withIndex()){
        println("${index+1}번째 학생 : ${name}")
    }

    var sum = 0
//    for(i in 1..18){  // 1 ~ 18
//    for(i in 1..18 step 2){
//    for(i in 10 downTo 1){
    for(i in 1 until 100) {  // 1~99
        sum += i
    }
    println(sum)

    var index = 0
    while(index < 10){
        println("current index : ${index}")
        index++
    }
}

// 7. Nullable / NonNull

fun nullcheck(){
    // NPE : NULL pointer Exception <--- 많이 쓴다!!!
    var name : String = "HanHoon"
    var nullName : String? = null

    var nameInUpperCase = name.toUpperCase()

    // nullName이 null이 아니면 toUpperCase를 하고, null이면 null을 반환한다.
    var nullNameInUpperCase = nullName?.toUpperCase()

    // 7: (엘비스 연산자?) <--- 많이쓴다!!!!
//    val lastName : String? = null
    val lastName : String? = "Park"
    var fullName = name + " " + (lastName?: "No lastName")
    println(fullName)
}

// !! (절대로 null일리가 없다고 인지시켜주는 코드)
fun ignoreNulls(str : String?){
    val mNotNull : String = str!!
    val upper = mNotNull.toUpperCase()

//    val email = "hoongrammer@gmail.com"
    val email : String? = "hoongrammer@gmail.com"
    email?.let {
        println("my email is ${email}")
    }
}