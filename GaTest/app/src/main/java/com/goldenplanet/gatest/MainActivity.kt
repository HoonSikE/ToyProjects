package com.goldenplanet.gatest

import android.os.Bundle
import android.widget.Button
import android.widget.TextView
import androidx.activity.enableEdgeToEdge
import androidx.appcompat.app.AppCompatActivity
import androidx.core.view.ViewCompat
import androidx.core.view.WindowInsetsCompat
import com.google.firebase.Firebase
import com.google.firebase.analytics.*

class MainActivity : AppCompatActivity() {
    private lateinit var mFirebaseAnalytics: FirebaseAnalytics
    private lateinit var button_userid: TextView
    private lateinit var button_property: TextView
    private lateinit var button_pageview: TextView
    private lateinit var button_event: TextView
    private lateinit var button_ecommerce: TextView

    override fun onCreate(savedInstanceState: Bundle?) {
        super.onCreate(savedInstanceState)
        setContentView(R.layout.activity_main)

        button_userid = findViewById(R.id.button_userid)
        button_property = findViewById(R.id.button_property)
        button_pageview = findViewById(R.id.button_pageview)
        button_event = findViewById(R.id.button_event)
        button_ecommerce = findViewById(R.id.button_ecommerce)

        setFirebase()

        setOnClickListener()
    }

    fun setFirebase(){
        mFirebaseAnalytics = Firebase.analytics
    }

    fun setOnClickListener(){
        // 유저 id
        button_userid.setOnClickListener{
            mFirebaseAnalytics!!.setUserId("사용자 ID")
        }
        // 사용자 속성
        button_property.setOnClickListener{
            mFirebaseAnalytics!!.setUserProperty("user_property", "사용자 속성")
        }
        // 스크린뷰
        button_pageview.setOnClickListener{
            val bundle = Bundle()
            bundle.putString(FirebaseAnalytics.Param.SCREEN_NAME, "메인 홈")
            bundle.putString(FirebaseAnalytics.Param.SCREEN_CLASS, "MainActivity")
            bundle.putString("ep_page_name", "메ㅁㄴㅇㄹㅁㄴㅇㄹ모ㅓㄴ앎나어럼낭로ㅓㄴㅇㄹㅁㄴㅇ러ㅁㄴㅇㄹㅁㄴㅇㄹ모ㅓㄴ앎나어럼낭로ㅓㄴㅇㄹㅁㄴㅇ러ㅁㄴㅇㄹㅁㄴㅇㄹ모ㅓㄴ앎나어럼낭로ㅓㄴㅇㄹㅁㄴㅇ러ㅁㄴㅇㄹㅁㄴㅇㄹ모ㅓㄴ앎나어럼낭로ㅓㄴㅇㄹㅁㄴㅇ러ㅁㄴㅇㄹㅁㄴㅇㄹ모ㅓㄴ앎나어럼낭로ㅓㄴㅇㄹㅁㄴㅇ러메ㅁㄴㅇㄹㅁㄴㅇㄹ모ㅓㄴ앎나어럼낭로ㅓㄴㅇㄹㅁㄴㅇ러ㅁㄴㅇㄹㅁㄴㅇㄹ모ㅓㄴ앎나어럼낭로ㅓㄴㅇㄹㅁㄴㅇ러ㅁㄴㅇㄹㅁㄴㅇㄹ모ㅓㄴ앎나어럼낭로ㅓㄴㅇㄹㅁㄴㅇ러ㅁㄴㅇㄹㅁㄴㅇㄹ모ㅓㄴ앎나어럼낭로ㅓㄴㅇㄹㅁㄴㅇ러ㅁㄴㅇㄹㅁㄴㅇㄹ모ㅓㄴ앎나어럼낭로ㅓㄴㅇㄹㅁㄴㅇ러메ㅁㄴㅇㄹㅁㄴㅇㄹ모ㅓㄴ앎나어럼낭로ㅓㄴㅇㄹㅁㄴㅇ러ㅁㄴㅇㄹㅁㄴㅇㄹ모ㅓㄴ앎나어럼낭로ㅓㄴㅇㄹㅁㄴㅇ러ㅁㄴㅇㄹㅁㄴㅇㄹ모ㅓㄴ앎나어럼낭로ㅓㄴㅇㄹㅁㄴㅇ러ㅁㄴㅇㄹㅁㄴㅇㄹ모ㅓㄴ앎나어럼낭로ㅓㄴㅇㄹㅁㄴㅇ러ㅁㄴㅇㄹㅁㄴㅇㄹ모ㅓㄴ앎나어럼낭로ㅓㄴㅇㄹㅁㄴㅇ러메ㅁㄴㅇㄹㅁㄴㅇㄹ모ㅓㄴ앎나어럼낭로ㅓㄴㅇㄹㅁㄴㅇ러ㅁㄴㅇㄹㅁㄴㅇㄹ모ㅓㄴ앎나어럼낭로ㅓㄴㅇㄹㅁㄴㅇ러ㅁㄴㅇㄹㅁㄴㅇㄹ모ㅓㄴ앎나어럼낭로ㅓㄴㅇㄹㅁㄴㅇ러ㅁㄴㅇㄹㅁㄴㅇㄹ모ㅓㄴ앎나어럼낭로ㅓㄴㅇㄹㅁㄴㅇ러ㅁㄴㅇㄹㅁㄴㅇㄹ모ㅓㄴ앎나어럼낭로ㅓㄴㅇㄹㅁㄴㅇ러메ㅁㄴㅇㄹㅁㄴㅇㄹ모ㅓㄴ앎나어럼낭로ㅓㄴㅇㄹㅁㄴㅇ러ㅁㄴㅇㄹㅁㄴㅇㄹ모ㅓㄴ앎나어럼낭로ㅓㄴㅇㄹㅁㄴㅇ러ㅁㄴㅇㄹㅁㄴㅇㄹ모ㅓㄴ앎나어럼낭로ㅓㄴㅇㄹㅁㄴㅇ러ㅁㄴㅇㄹㅁㄴㅇㄹ모ㅓㄴ앎나어럼낭로ㅓㄴㅇㄹㅁㄴㅇ러ㅁㄴㅇㄹㅁㄴㅇㄹ모ㅓㄴ앎나어럼낭로ㅓㄴㅇㄹㅁㄴㅇ러메ㅁㄴㅇㄹㅁㄴㅇㄹ모ㅓㄴ앎나어럼낭로ㅓㄴㅇㄹㅁㄴㅇ러ㅁㄴㅇㄹㅁㄴㅇㄹ모ㅓㄴ앎나어럼낭로ㅓㄴㅇㄹㅁㄴㅇ러ㅁㄴㅇㄹㅁㄴㅇㄹ모ㅓㄴ앎나어럼낭로ㅓㄴㅇㄹㅁㄴㅇ러ㅁㄴㅇㄹㅁㄴㅇㄹ모ㅓㄴ앎나어럼낭로ㅓㄴㅇㄹㅁㄴㅇ러ㅁㄴㅇㄹㅁㄴㅇㄹ모ㅓㄴ앎나어럼낭로ㅓㄴㅇㄹㅁㄴㅇ러메ㅁㄴㅇㄹㅁㄴㅇㄹ모ㅓㄴ앎나어럼낭로ㅓㄴㅇㄹㅁㄴㅇ러ㅁㄴㅇㄹㅁㄴㅇㄹ모ㅓㄴ앎나어럼낭로ㅓㄴㅇㄹㅁㄴㅇ러ㅁㄴㅇㄹㅁㄴㅇㄹ모ㅓㄴ앎나어럼낭로ㅓㄴㅇㄹㅁㄴㅇ러ㅁㄴㅇㄹㅁㄴㅇㄹ모ㅓㄴ앎나어럼낭로ㅓㄴㅇㄹㅁㄴㅇ러ㅁㄴㅇㄹㅁㄴㅇㄹ모ㅓㄴ앎나어럼낭로ㅓㄴㅇㄹㅁㄴㅇ러메ㅁㄴㅇㄹㅁㄴㅇㄹ모ㅓㄴ앎나어럼낭로ㅓㄴㅇㄹㅁㄴㅇ러ㅁㄴㅇㄹㅁㄴㅇㄹ모ㅓㄴ앎나어럼낭로ㅓㄴㅇㄹㅁㄴㅇ러ㅁㄴㅇㄹㅁㄴㅇㄹ모ㅓㄴ앎나어럼낭로ㅓㄴㅇㄹㅁㄴㅇ러ㅁㄴㅇㄹㅁㄴㅇㄹ모ㅓㄴ앎나어럼낭로ㅓㄴㅇㄹㅁㄴㅇ러ㅁㄴㅇㄹㅁㄴㅇㄹ모ㅓㄴ앎나어럼낭로ㅓㄴㅇㄹㅁㄴㅇ러메ㅁㄴㅇㄹㅁㄴㅇㄹ모ㅓㄴ앎나어럼낭로ㅓㄴㅇㄹㅁㄴㅇ러ㅁㄴㅇㄹㅁㄴㅇㄹ모ㅓㄴ앎나어럼낭로ㅓㄴㅇㄹㅁㄴㅇ러ㅁㄴㅇㄹㅁㄴㅇㄹ모ㅓㄴ앎나어럼낭로ㅓㄴㅇㄹㅁㄴㅇ러ㅁㄴㅇㄹㅁㄴㅇㄹ모ㅓㄴ앎나어럼낭로ㅓㄴㅇㄹㅁㄴㅇ러ㅁㄴㅇㄹㅁㄴㅇㄹ모ㅓㄴ앎나어럼낭로ㅓㄴㅇㄹㅁㄴㅇ러메ㅁㄴㅇㄹㅁㄴㅇㄹ모ㅓㄴ앎나어럼낭로ㅓㄴㅇㄹㅁㄴㅇ러ㅁㄴㅇㄹㅁㄴㅇㄹ모ㅓㄴ앎나어럼낭로ㅓㄴㅇㄹㅁㄴㅇ러ㅁㄴㅇㄹㅁㄴㅇㄹ모ㅓㄴ앎나어럼낭로ㅓㄴㅇㄹㅁㄴㅇ러ㅁㄴㅇㄹㅁㄴㅇㄹ모ㅓㄴ앎나어럼낭로ㅓㄴㅇㄹㅁㄴㅇ러ㅁㄴㅇㄹㅁㄴㅇㄹ모ㅓㄴ앎나어럼낭로ㅓㄴㅇㄹㅁㄴㅇ러메ㅁㄴㅇㄹㅁㄴㅇㄹ모ㅓㄴ앎나어럼낭로ㅓㄴㅇㄹㅁㄴㅇ러ㅁㄴㅇㄹㅁㄴㅇㄹ모ㅓㄴ앎나어럼낭로ㅓㄴㅇㄹㅁㄴㅇ러ㅁㄴㅇㄹㅁㄴㅇㄹ모ㅓㄴ앎나어럼낭로ㅓㄴㅇㄹㅁㄴㅇ러ㅁㄴㅇㄹㅁㄴㅇㄹ모ㅓㄴ앎나어럼낭로ㅓㄴㅇㄹㅁㄴㅇ러ㅁㄴㅇㄹㅁㄴㅇㄹ모ㅓㄴ앎나어럼낭로ㅓㄴㅇㄹㅁㄴㅇ러메ㅁㄴㅇㄹㅁㄴㅇㄹ모ㅓㄴ앎나어럼낭로ㅓㄴㅇㄹㅁㄴㅇ러ㅁㄴㅇㄹㅁㄴㅇㄹ모ㅓㄴ앎나어럼낭로ㅓㄴㅇㄹㅁㄴㅇ러ㅁㄴㅇㄹㅁㄴㅇㄹ모ㅓㄴ앎나어럼낭로ㅓㄴㅇㄹㅁㄴㅇ러ㅁㄴㅇㄹㅁㄴㅇㄹ모ㅓㄴ앎나어럼낭로ㅓㄴㅇㄹㅁㄴㅇ러ㅁㄴㅇㄹㅁㄴㅇㄹ모ㅓㄴ앎나어럼낭로ㅓㄴㅇㄹㅁㄴㅇ러메ㅁㄴㅇㄹㅁㄴㅇㄹ모ㅓㄴ앎나어럼낭로ㅓㄴㅇㄹㅁㄴㅇ러ㅁㄴㅇㄹㅁㄴㅇㄹ모ㅓㄴ앎나어럼낭로ㅓㄴㅇㄹㅁㄴㅇ러ㅁㄴㅇㄹㅁㄴㅇㄹ모ㅓㄴ앎나어럼낭로ㅓㄴㅇㄹㅁㄴㅇ러ㅁㄴㅇㄹㅁㄴㅇㄹ모ㅓㄴ앎나어럼낭로ㅓㄴㅇㄹㅁㄴㅇ러ㅁㄴㅇㄹㅁㄴㅇㄹ모ㅓㄴ앎나어럼낭로ㅓㄴㅇㄹㅁㄴㅇ러메ㅁㄴㅇㄹㅁㄴㅇㄹ모ㅓㄴ앎나어럼낭로ㅓㄴㅇㄹㅁㄴㅇ러ㅁㄴㅇㄹㅁㄴㅇㄹ모ㅓㄴ앎나어럼낭로ㅓㄴㅇㄹㅁㄴㅇ러ㅁㄴㅇㄹㅁㄴㅇㄹ모ㅓㄴ앎나어럼낭로ㅓㄴㅇㄹㅁㄴㅇ러ㅁㄴㅇㄹㅁㄴㅇㄹ모ㅓㄴ앎나어럼낭로ㅓㄴㅇㄹㅁㄴㅇ러ㅁㄴㅇㄹㅁㄴㅇㄹ모ㅓㄴ앎나어럼낭로ㅓㄴㅇㄹㅁㄴㅇ러")

            mFirebaseAnalytics!!.logEvent(FirebaseAnalytics.Event.SCREEN_VIEW, bundle)
        }
        // 이벤트
        button_event.setOnClickListener{
            val bundle = Bundle().apply {
                putString("ep_event_category", "test_category")
                putString("ep_event_action", "test_action")
                putString("ep_event_label", "test_label")
            }
            mFirebaseAnalytics!!.logEvent("Test_Event", bundle)
        }
        // 전자 상거래
        button_ecommerce.setOnClickListener{
            val itemBundle = Bundle().apply {
                putString(FirebaseAnalytics.Param.ITEM_ID, "SKU_123")
                putString(FirebaseAnalytics.Param.ITEM_NAME, "jeggings")
                putString(FirebaseAnalytics.Param.ITEM_CATEGORY, "pants")
                putString(FirebaseAnalytics.Param.ITEM_VARIANT, "black")
                putString(FirebaseAnalytics.Param.ITEM_BRAND, "Google")
                putString(FirebaseAnalytics.Param.CURRENCY, "USD")
                putString(FirebaseAnalytics.Param.COUPON, "ITEM_COU")
                putDouble(FirebaseAnalytics.Param.PRICE, 9.99)
                putLong(FirebaseAnalytics.Param.INDEX, 1)
                putLong(FirebaseAnalytics.Param.QUANTITY, 1)
            }
            val purchaseBundle = Bundle().apply {
                putString(FirebaseAnalytics.Param.TRANSACTION_ID, "T12345")
                putString(FirebaseAnalytics.Param.AFFILIATION, "Google Store")
                putString(FirebaseAnalytics.Param.CURRENCY, "USD")
                putString(FirebaseAnalytics.Param.COUPON, "SUMMER_FUN")
                putDouble(FirebaseAnalytics.Param.VALUE, 14.98)
                putDouble(FirebaseAnalytics.Param.TAX, 2.58)
                putDouble(FirebaseAnalytics.Param.SHIPPING, 5.34)
                putParcelableArray(FirebaseAnalytics.Param.ITEMS, arrayOf(itemBundle))
            }
            mFirebaseAnalytics!!.logEvent(FirebaseAnalytics.Event.PURCHASE, purchaseBundle)
        }
    }

}