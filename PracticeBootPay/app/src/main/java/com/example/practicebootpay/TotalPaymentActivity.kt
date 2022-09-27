package com.example.practicebootpay

import android.os.Bundle
import android.util.Log
import android.view.View
import androidx.appcompat.app.AppCompatActivity
import com.example.practicebootpay.R
import kr.co.bootpay.android.Bootpay
import kr.co.bootpay.android.constants.BootpayBuildConfig
import kr.co.bootpay.android.events.BootpayEventListener
import kr.co.bootpay.android.models.BootExtra
import kr.co.bootpay.android.models.BootItem
import kr.co.bootpay.android.models.BootUser
import kr.co.bootpay.android.models.Payload

class TotalPaymentActivity: AppCompatActivity() {
    var applicationId = "6330fc4dcf9f6d001f9266d5"

    override fun onCreate(savedInstanceState: Bundle?) {
        super.onCreate(savedInstanceState)
        setContentView(R.layout.activity_total_payment)
        if (BootpayBuildConfig.DEBUG) {
            applicationId = "6330fc4dcf9f6d001f9266d5"
        }
    }


    fun PaymentTest(v: View?) {
        val extra = BootExtra()
            .setCardQuota("0,2,3") // 일시불, 2개월, 3개월 할부 허용, 할부는 최대 12개월까지 사용됨 (5만원 이상 구매시 할부허용 범위)
        val items: MutableList<BootItem> = ArrayList()
        val item1 = BootItem().setName("마우's 스").setId("ITEM_CODE_MOUSE").setQty(1).setPrice(50.0)
        val item2 = BootItem().setName("키보드").setId("ITEM_KEYBOARD_MOUSE").setQty(1).setPrice(50.0)
        items.add(item1)
        items.add(item2)
        val payload = Payload()

        payload.setApplicationId(applicationId)
            // 주문 이름 설정
            .setOrderName("알파카 최고에용~")
            // 사용할 PG사, 결제 방식 -> 설정 안 하면 통합 결제
//            .setPg("페이레터")
//            .setMethod("카드자동")
            .setOrderId("1234")
            // Price와 items의 가격정보가 일치해야 한다.
            .setPrice(100.0)
            .setUser(getBootUser())
            .setExtra(extra).items = items

        val map: MutableMap<String, Any> = HashMap()
        map["Service Name"] = "알파카 최고에용~"
        map["Price"] = "100.0" + "원"
        payload.metadata = map

        Bootpay.init(supportFragmentManager, applicationContext)
            .setPayload(payload)
            .setEventListener(object : BootpayEventListener {
                override fun onCancel(data: String) {
                    Log.d("bootpay", "cancel: $data")
                }

                override fun onError(data: String) {
                    Log.d("bootpay", "error: $data")
                }

                override fun onClose(data: String) {
                    Log.d("bootpay", "close: $data")
                    Bootpay.removePaymentWindow()
                }

                override fun onIssued(data: String) {
                    Log.d("bootpay", "issued: $data")
                }

                override fun onConfirm(data: String): Boolean {
                    Log.d("bootpay", "confirm: $data")
                    //                        Bootpay.transactionConfirm(data); //재고가 있어서 결제를 진행하려 할때 true (방법 1)
                    return true //재고가 있어서 결제를 진행하려 할때 true (방법 2)
                    //                        return false; //결제를 진행하지 않을때 false
                }

                override fun onDone(data: String) {
                    Log.d("done", data)
                }
            }).requestPayment()
    }

    fun getBootUser(): BootUser? {
//        val userId = "123411aaaaaaaaaaaabd4ss121"
        val user = BootUser()
        user.id = "phh7485@gmail.com"
//        user.id = userId
//        user.area = "서울"
//        user.gender = 1 //1: 남자, 0: 여자
        user.email = "phh7485@gmail.com"
        user.phone = "010-4509-7485"
//        user.birth = "1988-06-10"
        user.username = "박한훈"
        return user
    }
}