//
//  ProductPurchaseViewController.swift
//  IOSBasic
//
//  Created by 박한훈 on 5/20/24.
//

import Foundation
import UIKit
import FirebaseAnalytics

class ProductPurchaseViewController : UIViewController{
    let global = Global.shared

    override func viewDidAppear(_ animated: Bool) {
        super.viewDidAppear(animated)
        print("상품 주문 화면 출력")

        // 스크린뷰 데이터 구성
        global.defaultDict[AnalyticsParameterScreenName] = "상품 주문 화면"
        global.defaultDict[AnalyticsParameterScreenClass] = "ProductPurchaseViewController"
        global.defaultDict["ep_page_name"] = "상품 주문 화면"

               
        let gaData = global.defaultDict

        Analytics.logEvent(AnalyticsEventScreenView, parameters: gaData)  // 화면 데이터 전송
    }
    // 구매 및 환불 페이지
    @IBAction func move_product_refund_button(_ sender: UIButton) {
        print("구매 버튼 클릭")
        
        // 클릭 맞춤 이벤트 입력
        global.clickDict["ep_click_page"] = "구매 화면>상품 구매"
        global.clickDict["ep_click_label"] = "상품 구매"
               
        setPurchaseDict()
               
        let gaData = global.defaultDict
            .merging(global.clickDict) {(_,new) in new}
            .merging(global.purchaseDict) {(_, new) in new }
        
        Analytics.logEvent(AnalyticsEventAddPaymentInfo, parameters: gaData)
    }
    // 거래 정보
    func setPurchaseDict(){
        print("purchaseDict 정의")
        
        global.purchaseDict[AnalyticsParameterTransactionID] = "NIKE00001"   // 거래 ID
        global.purchaseDict[AnalyticsParameterAffiliation] = "Coupang"       // 제휴사 또는 오프라인 판매점 정보
        global.purchaseDict[AnalyticsParameterCurrency] = "USD"              // 결제 시 사용된 통화 코드
        global.purchaseDict[AnalyticsParameterCoupon] = "New_User"           // 구매 시 사용된 쿠폰 이름이나 쿠폰 코드
        global.purchaseDict[AnalyticsParameterValue] = 83.17                 // 거래 시 발생한 매출액 또는 이벤트의 금전적 가치
        global.purchaseDict[AnalyticsParameterTax] = 3.3                     // 해당 거래에서 발생한 세금
        global.purchaseDict[AnalyticsParameterShipping] = 4.51               // 해당 거래에서 발생한 배송비
        global.purchaseDict[AnalyticsParameterItems] = [global.itemDict]     // 해당 거래에서 선택한 결제 수단
    }
}
