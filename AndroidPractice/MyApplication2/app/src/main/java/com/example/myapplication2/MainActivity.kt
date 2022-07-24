package com.example.myapplication2

import androidx.appcompat.app.AppCompatActivity
import android.os.Bundle
import android.view.View
import kotlinx.android.synthetic.main.activity_main.*

class MainActivity : AppCompatActivity() {
    override fun onCreate(savedInstanceState: Bundle?) {
        super.onCreate(savedInstanceState)
        setContentView(R.layout.activity_main)

        button.setOnClickListener(object : View.OnClickListener {
            override fun onClick(p0: View?) {
                // to de..
            }

        })

        // 람다식 사용의 조건
        // 1. Kotlin interface가 아닌 자바 인터페이스여야 합니다.
        // 2. 그 인터페이스는 딱 하나의 메소드만 가져야 합니다.


        // 위의 "button.setOnClickListener(object : View.OnClickListener { ...." 와 같다
        button.setOnClickListener{
            // to do..
        }
    }
}