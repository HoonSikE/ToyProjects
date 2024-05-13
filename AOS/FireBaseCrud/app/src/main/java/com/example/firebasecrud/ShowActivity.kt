package com.example.firebasecrud

import androidx.appcompat.app.AppCompatActivity
import android.os.Bundle
import android.util.Log
import android.widget.Toast
import androidx.recyclerview.widget.ItemTouchHelper
import androidx.recyclerview.widget.LinearLayoutManager
import androidx.recyclerview.widget.RecyclerView
import com.google.android.gms.tasks.OnCompleteListener
import com.google.android.gms.tasks.OnFailureListener
import com.google.android.gms.tasks.Task
import com.google.firebase.firestore.*

class ShowActivity : AppCompatActivity() {

    private lateinit var recyclerView: RecyclerView
    private lateinit var documentArrayList: ArrayList<Document>
    private lateinit var myAdapter: MyAdapter
    private lateinit var db : FirebaseFirestore

    override fun onCreate(savedInstanceState: Bundle?) {
        super.onCreate(savedInstanceState)
        setContentView(R.layout.activity_show)

        recyclerView = findViewById(R.id.recyclerview)
        recyclerView.setHasFixedSize(true)
        recyclerView.layoutManager = LinearLayoutManager(this)

        db = FirebaseFirestore.getInstance()

        documentArrayList = arrayListOf()

        myAdapter = MyAdapter(this, documentArrayList)

        recyclerView.adapter = myAdapter


        var touchHelper : ItemTouchHelper = ItemTouchHelper(TouchHelper(myAdapter))
        touchHelper.attachToRecyclerView(recyclerView)
        showData()
    }

    public fun showData() {
        db.collection("Documents").get().addOnCompleteListener(object : OnCompleteListener<QuerySnapshot>{
            override fun onComplete(task: Task<QuerySnapshot>) {
                documentArrayList.clear()

                for (snapshot : DocumentSnapshot in task.getResult()){
                    val document : Document = Document(snapshot.getString("id"), snapshot.getLong("number"), snapshot.getString("title"), snapshot.getString("desc"))
                    documentArrayList.add(document)
                }
                myAdapter.notifyDataSetChanged()
            }
        }).addOnFailureListener(OnFailureListener {
            Toast.makeText(this, "Oops ... something went wrong", Toast.LENGTH_SHORT).show()
        })

        db.collection("Documents").orderBy("title", Query.Direction.ASCENDING)
            .addSnapshotListener(object : EventListener<QuerySnapshot>{
                override fun onEvent(value: QuerySnapshot?, error: FirebaseFirestoreException?) {
                    if (error != null){
                        Log.e("Firestore Error", error.message.toString())
                        return
                    }
                    for (dc : DocumentChange in value?.documentChanges!!){
                        if(dc.type == DocumentChange.Type.ADDED){
                            documentArrayList.add(dc.document.toObject(Document::class.java))
                        }
                    }

                    myAdapter.notifyDataSetChanged()
                }
            })
    }
}