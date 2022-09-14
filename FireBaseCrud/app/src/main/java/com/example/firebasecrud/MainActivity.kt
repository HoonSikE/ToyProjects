package com.example.firebasecrud

import androidx.appcompat.app.AppCompatActivity
import android.os.Bundle
import android.widget.Button
import android.widget.EditText
import android.widget.Toast
import com.google.firebase.firestore.FirebaseFirestore
import java.util.*
import kotlin.collections.HashMap

class MainActivity : AppCompatActivity() {

    private lateinit var mTitle: EditText
    private lateinit var mDesc: EditText
    private lateinit var mSaveBtn: Button
    private lateinit var mShowBtn: Button
    private lateinit var db: FirebaseFirestore

    override fun onCreate(savedInstanceState: Bundle?) {
        super.onCreate(savedInstanceState)
        setContentView(R.layout.activity_main)

        mTitle = findViewById(R.id.edit_title)
        mDesc = findViewById(R.id.edit_desc)
        mSaveBtn = findViewById(R.id.save_btn)
        mShowBtn = findViewById(R.id.showall_btn)

        db= FirebaseFirestore.getInstance()

        mSaveBtn.setOnClickListener{
            var title = mTitle.text.toString()
            var desc = mDesc.text.toString()
            var id = UUID.randomUUID().toString()

            saveToFireStore(id, title, desc)
        }
    }

    private fun saveToFireStore(id : String, title: String, desc : String){
        if(!title.isEmpty() && !desc.isEmpty()){
            var map = HashMap<String, Any>()
            map.put("id", id)
            map.put("title", title)
            map.put("desc", desc)

            db.collection("Documents").document(id).set(map)
                .addOnCompleteListener { task ->
                    if (task.isSuccessful) {
                        Toast.makeText(this, "Data Saved !!", Toast.LENGTH_SHORT).show()

//                        val intent = Intent(this@SplashActivity, ServiceActivity::class.java)
//                        COMMAND.clearActivityStack(intent)
//                        startActivity(intent)
                    } else {
//                        ToastMaker.getInstance().getHandler().sendEmptyMessage(2)
//                        goSignUp()
                    }

                }.addOnFailureListener { task ->
                    Toast.makeText(this, "Failed !!", Toast.LENGTH_SHORT).show()
                }
        }else
            Toast.makeText(this, "Empty Field not Allowd", Toast.LENGTH_SHORT).show()
    }
}