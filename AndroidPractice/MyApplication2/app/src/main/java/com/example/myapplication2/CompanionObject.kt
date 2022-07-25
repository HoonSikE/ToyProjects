package com.example.myapplication2

// private constructor : 다른곳에서는 만들지 못하게 설정
class Book private constructor(val id : Int, val name : String) {
//    companion object{
    // 뒤에 BookFactory 처럼 붙여주면 이름 지정 가능
    companion object BookFactory : IdProvider{
        override fun getId(): Int {
            return 777
        }

        val myBook = "new book"

        fun create() = Book(getId(), myBook)
}
}

interface IdProvider{
    fun getId() : Int
}

fun main(){
    // 객체 생성
//    val book = Book.Companion.create()
    // Companion 생략 가능
    val book = Book.create()

    val bookId = Book.BookFactory.getId()
    println("${book.id} ${book.name}")
}