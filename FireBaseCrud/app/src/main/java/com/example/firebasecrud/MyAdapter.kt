package com.example.firebasecrud

import android.content.Intent
import android.os.Bundle
import android.view.LayoutInflater
import android.view.View
import android.view.ViewGroup
import android.widget.TextView
import android.widget.Toast
import androidx.recyclerview.widget.RecyclerView
import com.google.firebase.firestore.FirebaseFirestore

class MyAdapter(private val activity : ShowActivity, private val documentList: ArrayList<Document>) : RecyclerView.Adapter<MyAdapter.MyViewHolder>() {

    private var db : FirebaseFirestore = FirebaseFirestore.getInstance()

    public fun updateDate(position : Int){
        val item : Document  = documentList.get(position)
        val bundle : Bundle = Bundle()

        bundle.putString("uId", item.id)
        bundle.putString("uNumber", item.number.toString())
        bundle.putString("uTitle", item.title)
        bundle.putString("uDesc", item.desc)

        var intent : Intent = Intent(activity, MainActivity::class.java)
        intent.putExtras(bundle)
        activity.startActivity(intent)
    }

    public fun deleteDate(position : Int){
        val item : Document = documentList.get(position)
        db.collection("Documents").document(item.id.toString()).delete()
            .addOnCompleteListener { task ->
                if (task.isSuccessful) {
                    notifyRemoved(position)
                    Toast.makeText(activity, "Data Deleteded !!", Toast.LENGTH_SHORT).show()
                } else {
                    Toast.makeText(activity, "Error : " + task.exception?.message, Toast.LENGTH_SHORT).show()
                }

            }.addOnFailureListener { task ->
                Toast.makeText(activity, "Failed !!", Toast.LENGTH_SHORT).show()
            }
    }

    public fun notifyRemoved(position: Int){
        documentList.removeAt(position)
        notifyItemRemoved(position)
        activity.showData()
    }

    override fun onCreateViewHolder(parent: ViewGroup, viewType: Int) : MyAdapter.MyViewHolder{
//        val itemView = LayoutInflater.from(parent.context).inflate(R.layout.item, parent, false)
        val itemView = LayoutInflater.from(activity).inflate(R.layout.item, parent, false)

        return MyViewHolder(itemView)
    }

    override fun onBindViewHolder(holder: MyAdapter.MyViewHolder, position: Int) {
        val document : Document = documentList[position]
        holder.number.text = document.number.toString()
        holder.title.text = document.title
        holder.desc.text = document.desc
    }

    override fun getItemCount(): Int {
        return documentList.size
    }

    public class MyViewHolder(itemView : View) : RecyclerView.ViewHolder(itemView){
        val number : TextView = itemView.findViewById(R.id.number_text)
        val title : TextView = itemView.findViewById(R.id.title_text)
        val desc : TextView = itemView.findViewById(R.id.desc_text)
    }
}

//class MyAdapter(private val documentList: ArrayList<Document>) : RecyclerView.Adapter<MyAdapter.MyViewHolder>() {
//
//    override fun onCreateViewHolder(parent: ViewGroup, viewType: Int) : MyAdapter.MyViewHolder{
//        val itemView = LayoutInflater.from(parent.context).inflate(R.layout.item, parent, false)
//
//        return MyViewHolder(itemView)
//    }
//
//    override fun onBindViewHolder(holder: MyAdapter.MyViewHolder, position: Int) {
//        val document : Document = documentList[position]
//        holder.number.text = document.number.toString()
//        holder.title.text = document.title
//        holder.desc.text = document.desc
//    }
//
//    override fun getItemCount(): Int {
//        return documentList.size
//    }
//
//    public class MyViewHolder(itemView : View) : RecyclerView.ViewHolder(itemView){
//        val number : TextView = itemView.findViewById(R.id.number_text)
//        val title : TextView = itemView.findViewById(R.id.title_text)
//        val desc : TextView = itemView.findViewById(R.id.desc_text)
//    }
//}