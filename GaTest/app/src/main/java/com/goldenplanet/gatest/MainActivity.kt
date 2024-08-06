package com.goldenplanet.gatest

import android.os.Bundle
import androidx.activity.ComponentActivity
import androidx.activity.compose.setContent
import androidx.activity.enableEdgeToEdge
import androidx.compose.foundation.layout.fillMaxSize
import androidx.compose.foundation.layout.padding
import androidx.compose.material3.Scaffold
import androidx.compose.material3.Text
import androidx.compose.runtime.Composable
import androidx.compose.ui.Modifier
import androidx.compose.ui.tooling.preview.Preview
import com.goldenplanet.gatest.ui.theme.GaTestTheme
import com.google.firebase.Firebase
import com.google.firebase.analytics.FirebaseAnalytics
import com.google.firebase.analytics.analytics

class MainActivity : ComponentActivity() {
    private lateinit var mFirebaseAnalytics: FirebaseAnalytics

    override fun onCreate(savedInstanceState: Bundle?) {
        super.onCreate(savedInstanceState)
        enableEdgeToEdge()
        setContent {
            GaTestTheme {
                Scaffold(modifier = Modifier.fillMaxSize()) { innerPadding ->
                    Greeting(
                        name = "Android",
                        modifier = Modifier.padding(innerPadding)
                    )
                }
            }
        }
        mFirebaseAnalytics = Firebase.analytics


        val defaultBundle = Bundle()
        defaultBundle.putString("ep_visit_login_yn", "Y")
        defaultBundle.putString("ep_visit_channel_option", "APP")

        // 사용자 속성
        mFirebaseAnalytics!!.setUserProperty("up_cid", "up_cid_test")
        mFirebaseAnalytics!!.setUserProperty("up_uid", "ad3asdfg123dda456")

        // uid 설정
        mFirebaseAnalytics!!.setUserId("ad3asdfg123dda456")

        // 스크린 뷰
        val bundle = Bundle()
        bundle.putString(FirebaseAnalytics.Param.SCREEN_NAME, "메인 홈")
        bundle.putString("event_parameter", "이벤트 매개변수")
        mFirebaseAnalytics!!.setUserProperty("user_property", "사용자 속성")
        mFirebaseAnalytics!!.setUserId("사용자 ID")
        mFirebaseAnalytics!!.logEvent(FirebaseAnalytics.Event.SCREEN_VIEW, bundle)

        // 이벤트
        val bundle2 = Bundle().apply {
            putString("ep_event_category", "test_category")
            putString("ep_event_action", "test_action")
            putString("ep_event_label", "test_label")

        }
        mFirebaseAnalytics!!.logEvent("Test_Event", bundle2)

        // 전자 상거래
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

@Composable
fun Greeting(name: String, modifier: Modifier = Modifier) {
    Text(
        text = "Hello $name!",
        modifier = modifier
    )
}

@Preview(showBackground = true)
@Composable
fun GreetingPreview() {
    GaTestTheme {
        Greeting("Android")
    }
}