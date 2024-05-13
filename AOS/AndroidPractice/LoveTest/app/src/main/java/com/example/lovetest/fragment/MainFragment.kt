package com.example.lovetest.fragment

import android.os.Bundle
import androidx.fragment.app.Fragment
import android.view.LayoutInflater
import android.view.View
import android.view.ViewGroup
import androidx.navigation.NavController
import androidx.navigation.Navigation
import com.example.lovetest.R
import kotlinx.android.synthetic.main.fragment_main.*


class MainFragment : Fragment() {

    // lateinit을 할때는 항상 어떤 Type인지 써줘야 한다.
    lateinit var nav_Controller : NavController

    override fun onCreateView(
        inflater: LayoutInflater, container: ViewGroup?,
        savedInstanceState: Bundle?
    ): View? {
        // Inflate the layout for this fragment
        return inflater.inflate(R.layout.fragment_main, container, false)
    }

    override fun onViewCreated(view: View, savedInstanceState: Bundle?) {
        super.onViewCreated(view, savedInstanceState)

        nav_Controller = Navigation.findNavController(view)

        // 버튼을 눌렀을 때
        btn_next.setOnClickListener{
            // 다음 페이지로 이동
            nav_Controller.navigate(R.id.action_mainFragment_to_questionFragment)
        }
    }

}