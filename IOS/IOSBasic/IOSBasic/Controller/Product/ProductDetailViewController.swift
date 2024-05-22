//
//  ProductDetailViewController.swift
//  IOSBasic
//
//  Created by 박한훈 on 5/20/24.
//

import Foundation
import UIKit
import FirebaseAnalytics

class ProductDetailViewController : UIViewController{
    let global = Global.shared

    override func viewDidAppear(_ animated: Bool) {
        super.viewDidAppear(animated)
        print("상품 상세 화면 출력")
        // 스크린뷰 데이터 구성
        global.defaultDict[AnalyticsParameterScreenName] = "상품 상세 화면"
        global.defaultDict[AnalyticsParameterScreenClass] = "ProductDetailViewController"
        global.defaultDict["ep_page_name"] = "상품 상세 화면"
               
        let gaData = global.defaultDict

        Analytics.logEvent(AnalyticsEventScreenView, parameters: gaData)  // 화면 데이터 전송
        
        send_view_item()
    }
    // 상품 상세 정보 전송
    func send_view_item(){
        print("상품 상세 정보 전송")
        
        let gaData = global.defaultDict.merging(global.itemDict) {(_, new) in new }
        
        Analytics.logEvent(AnalyticsEventViewItem, parameters: gaData)
    }
    // 위시 리스트
    @IBAction func add_wish_list(_ sender: Any) {
        print("위시 리스트")
        
        // 클릭 맞춤 이벤트 입력
        global.clickDict["ep_click_page"] = "상품 상세 화면>위시리스트"
        global.clickDict["ep_click_label"] = "위시리스트"
                
        let gaData = global.defaultDict
            .merging(global.clickDict) {(_,new) in new}
            .merging(global.itemDict) {(_, new) in new }
        
        Analytics.logEvent(AnalyticsEventAddToWishlist, parameters: gaData)
    }
    
    // 장바구니 담기
    @IBAction func move_product_cart_button(_ sender: UIButton) {
        print("장바구니 담기")
        
        // 클릭 맞춤 이벤트 입력
        global.clickDict["ep_click_page"] = "상품 상세 화면>장바구니 담기"
        global.clickDict["ep_click_label"] = "장바구니 담기"
                
        let gaData = global.defaultDict
            .merging(global.clickDict) {(_,new) in new}
            .merging(global.itemDict) {(_, new) in new }
        
        Analytics.logEvent(AnalyticsEventAddToCart, parameters: gaData)
    }
    
    // 상품 주문 클릭
    @IBAction func move_product_purchase_button(_ sender: UIButton) {
        print("상품 주문 클릭")
         
        // 클릭 맞춤 이벤트 입력
        global.clickDict["ep_click_page"] = "상품 상세 화면>상품 구매"
        global.clickDict["ep_click_label"] = "상품 구매"
                
        let gaData = global.defaultDict
            .merging(global.clickDict) {(_,new) in new}
            .merging(global.itemDict) {(_, new) in new }
        
        Analytics.logEvent(AnalyticsEventBeginCheckout, parameters: gaData)
    }
}
