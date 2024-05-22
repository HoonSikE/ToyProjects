//
//  ProductCartViewController.swift
//  IOSBasic
//
//  Created by 박한훈 on 5/20/24.
//

import Foundation
import UIKit
import FirebaseAnalytics

class ProductCartViewController : UIViewController{
    let global = Global.shared

    override func viewDidAppear(_ animated: Bool) {
        super.viewDidAppear(animated)
        print("상품 장바구니 화면 출력")

        // 스크린뷰 데이터 구성
        global.defaultDict[AnalyticsParameterScreenName] = "상품 장바구니 화면"
        global.defaultDict[AnalyticsParameterScreenClass] = "ProductCartViewController"
        global.defaultDict["ep_page_name"] = "상품 장바구니 화면"
               
        let gaData = global.defaultDict

        Analytics.logEvent(AnalyticsEventScreenView, parameters: gaData)  // 화면 데이터 전송
        
        // 상품 상세 정보 전송
        send_view_cart()
    }
    // 장바구니 상세 정보 전송
    func send_view_cart(){
        print("장바구니 상세 정보")
        let gaData = global.defaultDict.merging(global.itemDict) {(_, new) in new }
        
        Analytics.logEvent(AnalyticsEventViewCart, parameters: gaData)
    }
    // 장바구니 제거
    @IBAction func remove_cart_button(_ sender: UIButton) {       
        print("장바구니 제거")

        // 클릭 맞춤 이벤트 입력
        global.clickDict["ep_click_page"] = "장바구니 화면>장바구니 제거 클릭"
        global.clickDict["ep_click_label"] = "장바구니 제거"
        
        let gaData = global.defaultDict.merging(global.itemDict) {(_, new) in new }
        
        Analytics.logEvent(AnalyticsEventRemoveFromCart, parameters: gaData)
    }
    // 상품 구매
    @IBAction func AddPaymentInfoButton(_ sender: Any) {
        print("상품 구매")

        // 클릭 맞춤 이벤트 입력
        global.clickDict["ep_click_page"] = "장바구니 화면>상품 구매"
        global.clickDict["ep_click_label"] = "상품 구매"
        
        let gaData = global.defaultDict.merging(global.itemDict) {(_, new) in new }
        
        Analytics.logEvent(AnalyticsEventAddPaymentInfo, parameters: gaData)
    }
}
