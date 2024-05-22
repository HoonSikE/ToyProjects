//
//  ProductMainViewController.swift
//  IOSBasic
//
//  Created by 박한훈 on 5/20/24.
//

import Foundation
import UIKit
import FirebaseAnalytics

class ProductMainViewController : UIViewController{
    let global = Global.shared

    override func viewDidAppear(_ animated: Bool) {
        super.viewDidAppear(animated)
        print("상품 메인 화면 출력")
        // 스크린뷰 데이터 구성
        global.defaultDict[AnalyticsParameterScreenName] = "상품 메인 화면"
        global.defaultDict[AnalyticsParameterScreenClass] = "ProductMainViewController"
        global.defaultDict["ep_page_name"] = "상품 메인 화면"
               
        let gaData = global.defaultDict

        Analytics.logEvent(AnalyticsEventScreenView, parameters: gaData)  // 화면 데이터 전송
    }
    
    // 상품 클릭
    @IBAction func move_product_detail_button(_ sender: UIButton) {
        print("상품 클릭")
        
        // 클릭 맞춤 이벤트 입력
        global.clickDict["ep_click_page"] = "상품 메인 화면>상품 클릭"
        global.clickDict["ep_click_label"] = "상품 클릭"
        
        // itemDict 정의
        setItemDict()
        
        let gaData = global.defaultDict
            .merging(global.clickDict) {(_,new) in new}
            .merging(global.itemDict) {(_, new) in new }
        
        Analytics.logEvent(AnalyticsEventSelectItem, parameters: gaData)
    }
    
    // itemDict 정의
    func setItemDict(){
        print("itemDict 정의")
        
        global.itemDict[AnalyticsParameterItemID] = "NK_777"         // 상품 ID
        global.itemDict[AnalyticsParameterItemName] = "나이키 스우시 티셔츠" // 상품 이름
        global.itemDict[AnalyticsParameterItemCategory] = "shirt"  // 상품 카테고리
        global.itemDict[AnalyticsParameterItemVariant] = "black"      // 상품 내 선택 옵션명 또는 옵션 코드 명
        global.itemDict[AnalyticsParameterItemBrand] = "nike"      // 상품 브랜드
        global.itemDict[AnalyticsParameterCurrency] = "USD"          // 통화 코드
        global.itemDict[AnalyticsParameterCoupon] = "NIKE_COUPON"    // 상품 관련 쿠폰 이름이나 쿠폰 코드
        global.itemDict[AnalyticsParameterPrice] = 100.0           // 상품 총 결제 금액
        global.itemDict[AnalyticsParameterIndex] = 1                 // 상품 목록에서 상품의 표시 위치
        global.itemDict[AnalyticsParameterQuantity] = 1               // 상품 수량
    }
}
