package com.example.lovetest.fragment

import android.os.Bundle
import androidx.fragment.app.Fragment
import android.view.LayoutInflater
import android.view.View
import android.view.ViewGroup
import androidx.navigation.NavController
import androidx.navigation.Navigation
import com.example.lovetest.R
import kotlinx.android.synthetic.main.fragment_result.*

class ResultFragment : Fragment() {

    var option = -1

    lateinit var navController: NavController

    override fun onCreateView(
        inflater: LayoutInflater, container: ViewGroup?,
        savedInstanceState: Bundle?
    ): View? {
        // Inflate the layout for this fragment

        // null 이면 -1을 반환하겠다
        option = arguments?.getInt("index")?:-1

        return inflater.inflate(R.layout.fragment_result, container, false)
    }

    override fun onViewCreated(view: View, savedInstanceState: Bundle?) {
        super.onViewCreated(view, savedInstanceState)

        navController = Navigation.findNavController(view)

        // 결과를 세팅해줌
        setResult(option)

        btn_home.setOnClickListener{
            navController.navigate(R.id.mainFragment)
        }
    }

    fun setResult(option : Int){
        when(option){
            1 -> {
                //tv_main.setText("") -> 똑같다
                tv_main.text = "You are a QUITTER!"
                tv_sub.text = "You can let the person easily."
            }
            2->{
                tv_main.text = "22222222222"
                tv_sub.text = "twotwotwotwotwotwotwotwotwotwotwotwotwotwotwo"
            }
            3->{
                tv_main.text = "333333333333333333333"
                tv_sub.text = "threethreethreethreethreethreethreethreethreethreethreethree"
            }
            4->{
                tv_main.text = "4444444444444"
                tv_sub.text = "fourfourfourfourfourfourfourfourfourfourfour"
            }
        }
    }

}