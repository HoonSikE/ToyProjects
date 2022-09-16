package com.example.firebasecrud

import android.content.Intent
import androidx.appcompat.app.AppCompatActivity
import android.os.Bundle
import android.widget.Button
import android.widget.EditText
import android.widget.Toast
import com.google.firebase.firestore.FirebaseFirestore
import java.util.*
import kotlin.collections.HashMap

/**
 * https://www.youtube.com/watch?v=trjltSUDqnI&list=PLhhNsarqV6MQ-eMvAOwjuBUDm7hfsTUta&index=8
 */
class MainActivity : AppCompatActivity() {

    private lateinit var mNumber: EditText
    private lateinit var mTitle: EditText
    private lateinit var mDesc: EditText
    private lateinit var mSaveBtn: Button
    private lateinit var mUpdateBtn: Button
    private lateinit var mShowBtn: Button
    private lateinit var db: FirebaseFirestore

    private lateinit var uId : String
    private var uNumber : Long = -1
    private lateinit var uTitle : String
    private lateinit var uDesc : String


    override fun onCreate(savedInstanceState: Bundle?) {
        super.onCreate(savedInstanceState)
        setContentView(R.layout.activity_main)

        mNumber = findViewById(R.id.edit_number)
        mTitle = findViewById(R.id.edit_title)
        mDesc = findViewById(R.id.edit_desc)
        mSaveBtn = findViewById(R.id.save_btn)
        mUpdateBtn = findViewById(R.id.update_btn)
        mUpdateBtn.isEnabled = false
        mShowBtn = findViewById(R.id.showall_btn)

        db= FirebaseFirestore.getInstance()

        var bundle : Bundle? = intent.extras
        if(bundle != null){
            mSaveBtn.setText("Update")
            uId = bundle.getString("uId")!!
            uNumber = bundle.getString("uNumber").toString().toLong()
            uTitle = bundle.getString("uTitle")!!
            uDesc = bundle.getString("uDesc")!!

            mNumber.setText(uNumber.toString())
            mTitle.setText(uTitle)
            mDesc.setText(uDesc)
        }else{
            mSaveBtn.setText("Save")
        }


        mSaveBtn.setOnClickListener{
            val number = mNumber.text.toString().toLong()
            val title = mTitle.text.toString()
            val desc = mDesc.text.toString()

            val bundle1 : Bundle? = intent.extras
            if(bundle1 != null){
                val id : String= uId
                updateToFireStore(id, number, title, desc)
            }else{
                val id = UUID.randomUUID().toString()
                saveToFireStore(id, number, title, desc)
            }

        }

//        mUpdateBtn.setOnClickListener{
//            number = mNumber.text.toString().toLong()
//            title = mTitle.text.toString()
//            desc = mDesc.text.toString()
//            saveToFireStore(id, number, title, desc)
//        }

        mShowBtn.setOnClickListener{
            startActivity(Intent(this, ShowActivity::class.java))
        }
    }

    private fun updateToFireStore(id: String, number : Long, title: String, desc: String) {
        db.collection("Documents").document(id).update("number", number, "title", title, "desc", desc)
            .addOnCompleteListener { task ->
                if (task.isSuccessful) {
                    Toast.makeText(this, "Data Updated !!", Toast.LENGTH_SHORT).show()
                } else {
                    Toast.makeText(this, "Error : " + task.exception?.message, Toast.LENGTH_SHORT).show()
                }

            }.addOnFailureListener { task ->
                Toast.makeText(this, "Failed !!", Toast.LENGTH_SHORT).show()
            }
    }

    private fun saveToFireStore(id : String, number : Long, title: String, desc : String){
        if(!title.isEmpty() && !desc.isEmpty()){
            var map = HashMap<String, Any>()
            map.put("id", id)
            map.put("number", number)
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