package com.example.lovetest.fragment

import android.os.Bundle
import androidx.fragment.app.Fragment
import android.view.LayoutInflater
import android.view.View
import android.view.ViewGroup
import androidx.appcompat.app.AppCompatActivity
import androidx.navigation.NavController
import androidx.navigation.fragment.findNavController
import com.example.lovetest.R
import kotlinx.android.synthetic.main.activity_main.*


class MainFragment : AppCompatActivity() {

    // nav 컨트롤러
    // lateinit : 지금 정의하는게 아니라 나중에 정의를 한다고 선언
    lateinit var navController : NavController

    override fun onCreate(savedInstanceState: Bundle?) {
        super.onCreate(savedInstanceState)
        setContentView(R.layout.activity_main)

        // id(nav_host_fragment)를 바로 써주면 사용가능하다!
        navController = nav_host_fragment.findNavController()
    }
}