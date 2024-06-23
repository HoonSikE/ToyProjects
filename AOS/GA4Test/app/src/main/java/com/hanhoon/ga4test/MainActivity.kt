package com.hanhoon.ga4test

import android.os.Bundle
import android.widget.TextView
import androidx.appcompat.app.AppCompatActivity
import com.google.firebase.Firebase
import com.google.firebase.analytics.FirebaseAnalytics
import com.google.firebase.analytics.analytics

//import com.hanhoon.GA4Test.WebAppInterface.Companion.mFirebaseAnalytics
//import com.hanhoon.GA4Test.WebAppInterface.Companion.ga4_cid


class MainActivity : AppCompatActivity() {
    private lateinit var mFirebaseAnalytics: FirebaseAnalytics

    // 버튼
    private lateinit var btn_screen_view: TextView
    private lateinit var btn_click_event: TextView
    private lateinit var btn_view_item_list: TextView
    private lateinit var btn_select_item: TextView
    private lateinit var btn_view_item: TextView
    private lateinit var btn_add_to_wishlist: TextView
    private lateinit var btn_add_to_cart: TextView
    private lateinit var btn_view_cart: TextView
    private lateinit var btn_remove_from_cart: TextView
    private lateinit var btn_begin_checkout: TextView
    private lateinit var btn_add_shipping_info: TextView
    private lateinit var btn_add_payment_info: TextView
    private lateinit var btn_purchase: TextView
    private lateinit var btn_refund: TextView

    private var item1Bundle: Bundle = Bundle().apply {
        putString(FirebaseAnalytics.Param.ITEM_ID, "VANS_12345")
        putString(FirebaseAnalytics.Param.ITEM_BRAND, "Vans")
        putString(FirebaseAnalytics.Param.ITEM_NAME, "반스 운동화 올드스쿨 블랙")
        putString(FirebaseAnalytics.Param.ITEM_VARIANT, "Black")
        putDouble(FirebaseAnalytics.Param.PRICE, 18860.0)
        putString(FirebaseAnalytics.Param.AFFILIATION, "Golden Mall")
        putString(FirebaseAnalytics.Param.COUPON, "SUMMER_FUN")
        putString(FirebaseAnalytics.Param.ITEM_CATEGORY, "Clothes")
        putString(FirebaseAnalytics.Param.ITEM_CATEGORY2, "Shoes")
        putInt(FirebaseAnalytics.Param.QUANTITY, 1)
        putInt(FirebaseAnalytics.Param.INDEX, 0)
    }

    private var item2Bundle: Bundle = Bundle().apply {
        putString(FirebaseAnalytics.Param.ITEM_ID, "CROCS_67890")
        putString(FirebaseAnalytics.Param.ITEM_BRAND, "Crocs")
        putString(FirebaseAnalytics.Param.ITEM_NAME, "바야밴드 클로그")
        putString(FirebaseAnalytics.Param.ITEM_VARIANT, "White")
        putDouble(FirebaseAnalytics.Param.PRICE, 35900.0)
        putString(FirebaseAnalytics.Param.AFFILIATION, "Golden Mall")
        putString(FirebaseAnalytics.Param.COUPON, "SUMMER_FUN")
        putString(FirebaseAnalytics.Param.ITEM_CATEGORY, "Clothes")
        putString(FirebaseAnalytics.Param.ITEM_CATEGORY2, "Shoes")
        putInt(FirebaseAnalytics.Param.QUANTITY, 1)
        putInt(FirebaseAnalytics.Param.INDEX, 1)
    }

    private var item3Bundle: Bundle = Bundle().apply {
        putString(FirebaseAnalytics.Param.ITEM_ID, "NIKE_369")
        putString(FirebaseAnalytics.Param.ITEM_BRAND, "Nike")
        putString(FirebaseAnalytics.Param.ITEM_NAME, "나이키 스우시 반팔")
        putString(FirebaseAnalytics.Param.ITEM_VARIANT, "Black/White")
        putDouble(FirebaseAnalytics.Param.PRICE, 22900.0)
        putString(FirebaseAnalytics.Param.AFFILIATION, "Golden Mall")
        putString(FirebaseAnalytics.Param.ITEM_CATEGORY, "Clothes")
        putString(FirebaseAnalytics.Param.ITEM_CATEGORY2, "Shirt")
        putInt(FirebaseAnalytics.Param.QUANTITY, 1)
        putInt(FirebaseAnalytics.Param.INDEX, 2)
    }

    private var item4Bundle: Bundle = Bundle().apply {
        putString(FirebaseAnalytics.Param.ITEM_ID, "COMME_777")
        putString(FirebaseAnalytics.Param.ITEM_BRAND, "꼼데가르송")
        putString(FirebaseAnalytics.Param.ITEM_NAME, "PLAY 반팔티셔츠")
        putString(FirebaseAnalytics.Param.ITEM_VARIANT, "White")
        putDouble(FirebaseAnalytics.Param.PRICE, 123000.0)
        putString(FirebaseAnalytics.Param.AFFILIATION, "Golden Mall")
        putString(FirebaseAnalytics.Param.ITEM_CATEGORY, "Clothes")
        putString(FirebaseAnalytics.Param.ITEM_CATEGORY2, "Shirt")
        putInt(FirebaseAnalytics.Param.QUANTITY, 1)
        putInt(FirebaseAnalytics.Param.INDEX, 3)
    }

    private var item5Bundle: Bundle = Bundle().apply {
        putString(FirebaseAnalytics.Param.ITEM_ID, "SAM_111")
        putString(FirebaseAnalytics.Param.ITEM_BRAND, "삼육두유")
        putString(FirebaseAnalytics.Param.ITEM_NAME, "검은참깨 두유")
        putDouble(FirebaseAnalytics.Param.PRICE, 19500.0)
        putString(FirebaseAnalytics.Param.AFFILIATION, "Golden Mall")
        putString(FirebaseAnalytics.Param.ITEM_CATEGORY, "Food")
        putString(FirebaseAnalytics.Param.ITEM_CATEGORY2, "Drink")
        putInt(FirebaseAnalytics.Param.QUANTITY, 32)
        putInt(FirebaseAnalytics.Param.INDEX, 4)
    }

    private var item6Bundle: Bundle = Bundle().apply {
        putString(FirebaseAnalytics.Param.ITEM_ID, "M_13579")
        putString(FirebaseAnalytics.Param.ITEM_BRAND, "매일유업")
        putString(FirebaseAnalytics.Param.ITEM_NAME, "아몬드 브리즈")
        putDouble(FirebaseAnalytics.Param.PRICE, 21900.0)
        putString(FirebaseAnalytics.Param.AFFILIATION, "Golden Mall")
        putString(FirebaseAnalytics.Param.ITEM_CATEGORY, "Food")
        putString(FirebaseAnalytics.Param.ITEM_CATEGORY2, "Drink")
        putInt(FirebaseAnalytics.Param.QUANTITY, 24)
        putInt(FirebaseAnalytics.Param.INDEX, 5)
    }

    override fun onCreate(savedInstanceState: Bundle?) {
        super.onCreate(savedInstanceState)
        setContentView(R.layout.activity_main)

        btn_screen_view = findViewById(R.id.btn_screen_view)
        btn_click_event = findViewById(R.id.btn_click_event)
        btn_view_item_list = findViewById(R.id.btn_view_item_list)
        btn_select_item = findViewById(R.id.btn_select_item)
        btn_view_item = findViewById(R.id.btn_view_item)
        btn_add_to_wishlist = findViewById(R.id.btn_add_to_wishlist)
        btn_add_to_cart = findViewById(R.id.btn_add_to_cart)
        btn_view_cart = findViewById(R.id.btn_view_cart)
        btn_remove_from_cart = findViewById(R.id.btn_remove_from_cart)
        btn_begin_checkout = findViewById(R.id.btn_begin_checkout)
        btn_add_shipping_info = findViewById(R.id.btn_add_shipping_info)
        btn_add_payment_info = findViewById(R.id.btn_add_payment_info)
        btn_purchase = findViewById(R.id.btn_purchase)
        btn_refund = findViewById(R.id.btn_refund)

        setFirebase()

        setOnClickListener()
    }

    fun setFirebase(){
        mFirebaseAnalytics = Firebase.analytics
    }

    fun setOnClickListener(){
        // 스크린뷰
        btn_screen_view.setOnClickListener{
            print("btn_screen_view")
            // 사용자 속성
//            mFirebaseAnalytics!!.setUserProperty(mFirebaseAnalytics.appInstanceId.toString(), "up_cid")
//            mFirebaseAnalytics!!.setUserProperty("user_property", "사용자 속성")
//            mFirebaseAnalytics!!.setUserProperty("hhpark", "up_uid")
//            mFirebaseAnalytics!!.setUserId("hhparksetUserID")
//            mFirebaseAnalytics!!.setUserProperty("개인", "up_type")
//            mFirebaseAnalytics!!.setUserProperty("20", "up_age")
//            mFirebaseAnalytics!!.setUserProperty("M", "up_gender")
//            mFirebaseAnalytics!!.setUserProperty("up_joindate", "20240604")

            var screenBundle: Bundle = Bundle().apply {
                putString(FirebaseAnalytics.Param.SCREEN_NAME, "메인>골든몰 홈")
                putString("ep_visit_channel", "AOS")
                putString("ep_login_yn", "Y")
                putString("ep_dow", "화")
            }

            mFirebaseAnalytics!!.logEvent(FirebaseAnalytics.Event.SCREEN_VIEW, screenBundle)
        }
        // 이벤트
        btn_click_event.setOnClickListener{
            print("btn_click_event")

            var eventBundle: Bundle = Bundle().apply {
                putString("ep_click_page", "이벤트 페이지")
                putString("ep_click_area", "이벤트 영역")
                putString("ep_click_area2", "이벤트 영역 2")
                putString("ep_click_label", "이벤트 테스트 라벨")
            }

            mFirebaseAnalytics!!.logEvent("Test_Event", eventBundle)
        }
        // 전자 상거래
        btn_view_item_list.setOnClickListener{
            print("btn_view_item_list")

            var purchaseBundle = Bundle().apply {
                putString(FirebaseAnalytics.Param.CURRENCY, "KRW")
                
                putParcelableArray(FirebaseAnalytics.Param.ITEMS, arrayOf(item1Bundle, item2Bundle, item3Bundle, item4Bundle))
            }

            mFirebaseAnalytics!!.logEvent(FirebaseAnalytics.Event.VIEW_ITEM_LIST, purchaseBundle)
        }
        btn_select_item.setOnClickListener{
            print("btn_select_item")

            var purchaseBundle = Bundle().apply {
                putString(FirebaseAnalytics.Param.CURRENCY, "KRW")

                putParcelableArray(FirebaseAnalytics.Param.ITEMS, arrayOf(item1Bundle))
            }

            mFirebaseAnalytics!!.logEvent(FirebaseAnalytics.Event.SELECT_ITEM, purchaseBundle)
        }
        btn_view_item.setOnClickListener{
            print("btn_view_item")

            var purchaseBundle = Bundle().apply {
                putString(FirebaseAnalytics.Param.CURRENCY, "KRW")

                putParcelableArray(FirebaseAnalytics.Param.ITEMS, arrayOf(item1Bundle))
            }

            mFirebaseAnalytics!!.logEvent(FirebaseAnalytics.Event.VIEW_ITEM, purchaseBundle)
        }
        btn_add_to_wishlist.setOnClickListener{
            print("btn_add_to_wishlist")

            var purchaseBundle = Bundle().apply {
                putString(FirebaseAnalytics.Param.CURRENCY, "KRW")

                putParcelableArray(FirebaseAnalytics.Param.ITEMS, arrayOf(item1Bundle))
            }

            mFirebaseAnalytics!!.logEvent(FirebaseAnalytics.Event.ADD_TO_WISHLIST, purchaseBundle)
        }
        btn_add_to_cart.setOnClickListener{
            print("btn_add_to_cart")

            var purchaseBundle = Bundle().apply {
                putString(FirebaseAnalytics.Param.CURRENCY, "KRW")

                putParcelableArray(FirebaseAnalytics.Param.ITEMS, arrayOf(item1Bundle))
            }

            mFirebaseAnalytics!!.logEvent(FirebaseAnalytics.Event.ADD_TO_CART, purchaseBundle)
        }
        btn_view_cart.setOnClickListener{
            print("btn_view_cart")

            var purchaseBundle = Bundle().apply {
                putString(FirebaseAnalytics.Param.CURRENCY, "KRW")

                putParcelableArray(FirebaseAnalytics.Param.ITEMS, arrayOf(item1Bundle))
            }

            mFirebaseAnalytics!!.logEvent(FirebaseAnalytics.Event.VIEW_CART, purchaseBundle)
        }
        btn_remove_from_cart.setOnClickListener{
            print("btn_remove_from_cart")

            var purchaseBundle = Bundle().apply {
                putString(FirebaseAnalytics.Param.CURRENCY, "KRW")

                putParcelableArray(FirebaseAnalytics.Param.ITEMS, arrayOf(item1Bundle))
            }

            mFirebaseAnalytics!!.logEvent(FirebaseAnalytics.Event.REMOVE_FROM_CART, purchaseBundle)
        }
        btn_begin_checkout.setOnClickListener{
            print("btn_begin_checkout")

            var purchaseBundle = Bundle().apply {
                putString(FirebaseAnalytics.Param.CURRENCY, "KRW")

                putParcelableArray(FirebaseAnalytics.Param.ITEMS, arrayOf(item1Bundle))
            }

            mFirebaseAnalytics!!.logEvent(FirebaseAnalytics.Event.BEGIN_CHECKOUT, purchaseBundle)
        }
        btn_add_shipping_info.setOnClickListener{
            print("btn_add_shipping_info")

            var purchaseBundle = Bundle().apply {
                putString(FirebaseAnalytics.Param.CURRENCY, "KRW")
                putDouble(FirebaseAnalytics.Param.VALUE, 175860.0)
                putDouble(FirebaseAnalytics.Param.SHIPPING, 3000.0)
                putString(FirebaseAnalytics.Param.PAYMENT_TYPE, "Kakao Pay")

                putParcelableArray(FirebaseAnalytics.Param.ITEMS, arrayOf(item1Bundle, item2Bundle))
            }

            mFirebaseAnalytics!!.logEvent(FirebaseAnalytics.Event.ADD_SHIPPING_INFO, purchaseBundle)
        }
        btn_add_payment_info.setOnClickListener{
            print("btn_add_payment_info")

            var purchaseBundle = Bundle().apply {
                putString(FirebaseAnalytics.Param.CURRENCY, "KRW")
                putDouble(FirebaseAnalytics.Param.VALUE, 175860.0)
                putDouble(FirebaseAnalytics.Param.SHIPPING, 3000.0)
                putString(FirebaseAnalytics.Param.PAYMENT_TYPE, "Kakao Pay")

                putParcelableArray(FirebaseAnalytics.Param.ITEMS, arrayOf(item1Bundle, item2Bundle))
            }

            mFirebaseAnalytics!!.logEvent(FirebaseAnalytics.Event.ADD_PAYMENT_INFO, purchaseBundle)
        }
        btn_purchase.setOnClickListener{
            print("btn_purchase")

            // 랜덤 숫자 생성
            val randomNumber = (0..9).random()
            // 초기 transaction ID 생성
            val initialTransactionID = "GP-240507"
            // 최종 transaction ID 생성
            val finalTransactionID = "$initialTransactionID$randomNumber"

            var purchaseBundle = Bundle().apply {
                putString(FirebaseAnalytics.Param.CURRENCY, "KRW")
                putDouble(FirebaseAnalytics.Param.VALUE, 175860.0)
                putDouble(FirebaseAnalytics.Param.SHIPPING, 3000.0)
                putString(FirebaseAnalytics.Param.PAYMENT_TYPE, "Kakao Pay")
                putString(FirebaseAnalytics.Param.TRANSACTION_ID, finalTransactionID)

                putParcelableArray(FirebaseAnalytics.Param.ITEMS, arrayOf(item1Bundle, item2Bundle))
            }

            mFirebaseAnalytics!!.logEvent(FirebaseAnalytics.Event.PURCHASE, purchaseBundle)
        }
        btn_refund.setOnClickListener{
            print("btn_refund")

            // 랜덤 숫자 생성
            val randomNumber = (0..9).random()
            // 초기 transaction ID 생성
            val initialTransactionID = "GP-240507"
            // 최종 transaction ID 생성
            val finalTransactionID = "$initialTransactionID$randomNumber"

            var purchaseBundle = Bundle().apply {
                putString(FirebaseAnalytics.Param.CURRENCY, "KRW")
                putDouble(FirebaseAnalytics.Param.VALUE, 175860.0)
                putDouble(FirebaseAnalytics.Param.SHIPPING, 3000.0)
                putString(FirebaseAnalytics.Param.PAYMENT_TYPE, "Kakao Pay")
                putString(FirebaseAnalytics.Param.TRANSACTION_ID, finalTransactionID)

                putParcelableArray(FirebaseAnalytics.Param.ITEMS, arrayOf(item1Bundle, item2Bundle))
            }

            mFirebaseAnalytics!!.logEvent(FirebaseAnalytics.Event.REFUND, purchaseBundle)
        }
    }
}