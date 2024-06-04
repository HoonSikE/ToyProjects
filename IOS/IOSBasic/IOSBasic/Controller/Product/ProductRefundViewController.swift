//
//  ProductRefundViewController.swift
//  IOSBasic
//
//  Created by 박한훈 on 5/20/24.
//

import Foundation
import UIKit
import FirebaseAnalytics

class ProductRefundViewController : UIViewController{
    let global = Global.shared

    override func viewDidAppear(_ animated: Bool) {
        super.viewDidAppear(animated)
        print("상품 환불 화면 출력")

        // 스크린뷰 데이터 구성
        global.defaultDict[AnalyticsParameterScreenName] = "상품 환불 화면"
        global.defaultDict[AnalyticsParameterScreenClass] = "ProductRefundViewController"
        global.defaultDict["ep_page_name"] = "상품 환불 화면"

               
        let gaData = global.defaultDict
        
        Analytics.logEvent(AnalyticsEventScreenView, parameters: gaData)  // 화면 데이터 전송
        
        complete_Purchase()
        
        AnalyticsEventCampaignDetails
    }
    // 구매 완료
    func complete_Purchase(){
        print("구매 완료")
                       
        let gaData = global.defaultDict.merging(global.purchaseDict) {(_, new) in new }
        
        Analytics.logEvent(AnalyticsEventPurchase, parameters: gaData)
    }
    // 환불
    @IBAction func product_refund_button(_ sender: UIButton) {
        print("환불 버튼 클릭")

        // 클릭 맞춤 이벤트 입력
        global.clickDict["ep_click_page"] = "환불 화면>상품 환불"
        global.clickDict["ep_click_label"] = "상품 환불"
        
        let gaData = global.defaultDict
            .merging(global.clickDict) {(_,new) in new}
            .merging(global.purchaseDict) {(_, new) in new }
        
        Analytics.logEvent(AnalyticsEventRefund, parameters: gaData)
    }
}
