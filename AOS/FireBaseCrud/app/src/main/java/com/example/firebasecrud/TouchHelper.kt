package com.example.firebasecrud

import android.graphics.Canvas
import androidx.recyclerview.widget.ItemTouchHelper
import androidx.recyclerview.widget.RecyclerView
import android.R
import android.graphics.Color

import androidx.core.content.ContextCompat
import it.xabaras.android.recyclerview.swipedecorator.RecyclerViewSwipeDecorator


class TouchHelper(dragDirs: MyAdapter) :
    ItemTouchHelper.SimpleCallback(0, ItemTouchHelper.LEFT or ItemTouchHelper.RIGHT) {

    private var myAdapter: MyAdapter = dragDirs

    override fun onMove(
        recyclerView: RecyclerView,
        viewHolder: RecyclerView.ViewHolder,
        target: RecyclerView.ViewHolder
    ): Boolean {
        return false
    }

    override fun onSwiped(viewHolder: RecyclerView.ViewHolder, direction: Int) {
        val position : Int = viewHolder.adapterPosition
        if(direction == ItemTouchHelper.LEFT){
            myAdapter.deleteDate(position)
        }else{
            myAdapter.updateDate(position)
            myAdapter.notifyDataSetChanged()
        }
    }

    override fun onChildDraw(
        c: Canvas,
        recyclerView: RecyclerView,
        viewHolder: RecyclerView.ViewHolder,
        dX: Float,
        dY: Float,
        actionState: Int,
        isCurrentlyActive: Boolean
    ) {
        RecyclerViewSwipeDecorator.Builder(c, recyclerView, viewHolder, dX, dY, actionState, isCurrentlyActive)
            .addSwipeLeftBackgroundColor(Color.RED)
            .addSwipeLeftActionIcon(R.drawable.ic_delete)
            .addSwipeRightBackgroundColor(R.color.black)
            .addSwipeRightActionIcon(R.drawable.ic_menu_edit)
            .create()
            .decorate()

        super.onChildDraw(c, recyclerView, viewHolder, dX, dY, actionState, isCurrentlyActive)
    }
}

//class TouchHelper(dragDirs: MyAdapter) :
////    ItemTouchHelper.SimpleCallback(dragDirs, swipeDirs) {
//    ItemTouchHelper.SimpleCallback(0, ItemTouchHelper.LEFT) {
//
//    private lateinit var myAdapter: MyAdapter
//
//    override fun onMove(
//        recyclerView: RecyclerView,
//        viewHolder: RecyclerView.ViewHolder,
//        target: RecyclerView.ViewHolder
//    ): Boolean {
//        return false
//    }
//
//    override fun onSwiped(viewHolder: RecyclerView.ViewHolder, direction: Int) {
//        val position : Int = viewHolder.adapterPosition
//        if(direction == ItemTouchHelper.LEFT){
//            myAdapter.updateDate(position)
//            myAdapter.notifyDataSetChanged()
//        }else{
//
//        }
//    }
//}