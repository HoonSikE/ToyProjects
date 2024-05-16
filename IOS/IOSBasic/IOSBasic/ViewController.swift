//
//  ViewController.swift
//  IOSBasic
//
//  Created by 박한훈 on 5/14/24.
//

import UIKit
import FirebaseAnalytics

class ViewController: UIViewController {
    let defaultDict:[String:Any]=[          // 클래스 내 전역 변수 선언
        "ep_visit_login_yn":"Y",            // 방문 로그인 여부
        "ep_visit_channel_option":"APP"     // 방문 채널 유형
    ]

    override func viewDidLoad() {
        super.viewDidLoad()
        // Do any additional setup after loading the view.
    }
    
    override func viewDidAppear(_ animated: Bool) {
        super.viewDidAppear(animated)

//        // 스크린뷰 데이터 구성
//        let dict:[String: Any] = [
//            AnalyticsParameterScreenName:"화면명",                // 화면 이름 설정
//            AnalyticsParameterScreenClass:"ViewController",     // 화면 클래스 설정
//            "ep_visit_login_yn":"Y",                            // 이벤트 매개변수 설정
//            "ep_visit_channel_option":"APP"                     // 이벤트 매개변수 설정
//        ]
//        
//        Analytics.setUserProperty("사용자 속성", forName:"up_cid")   // 사용자 속성 설정
//        Analytics.setUserID("사용자 ID")                            // 사용자 ID 설정
//        
//        Analytics.logEvent(AnalyticsEventScreenView, parameters: dict)  // 화면 데이터 전송
//        
        /// 스크린뷰 전송 예시
        print("스크린뷰")
        // 이벤트 매개변수 설정
        Analytics.setUserProperty(Analytics.appInstanceID(), forName:"up_cid")   // 사용자 속성 설정 (고객_cid)
        Analytics.setUserProperty("사용자 속성", forName:"up_cid")   // 사용자 속성 설정
        Analytics.setUserID("사용자 ID")   // 사용자 ID 설정
        
        // 스크린뷰 데이터 구성
        let screenDic:[String: Any] = [
            AnalyticsParameterScreenName:"화면명",                // 화면 이름 설정
            AnalyticsParameterScreenClass:"ViewController",     // 화면 클래스 설정
        ]
               
        let gaData = defaultDict.merging(screenDic) {(_, new) in new }
        
        Analytics.logEvent(AnalyticsEventScreenView, parameters: gaData)  // 화면 데이터 전송
    }
    
    @IBAction func button_click(_ sender: UIButton) {
        print("다음 화면")
//         맞춤 이벤트 입력
        let eventDict: [String: Any] = [
            "name": "t_name",
            "title": "t_title"
        ]
        
        Analytics.logEvent("Test_Event", parameters: eventDict)
        
        /**
         let eventDict: [String: Any] = [
             "ep_button_area1": "버튼 영역",
             "ep_button_area2": "버튼 상세 영역",
             "ep_button_name": "버튼 명",
         ]
         
         let gaData = defaultDict.merging(eventDict) {(_,new) in new}
         
         Analytics.logEvent("click_event", parameters: eventDict)
         */
    }
    
    @IBAction func Button_Clik1(_ sender: Any) {
        print("전자상거래")

        // 상품 정보
        let itemDict: [String: Any] = [
            AnalyticsParameterItemID: "SKU_123",
            AnalyticsParameterItemName: "jeggings",
            AnalyticsParameterItemCategory: "pants",
            AnalyticsParameterItemVariant: "black",
            AnalyticsParameterItemBrand: "Google",
            AnalyticsParameterCurrency: "USD",
            AnalyticsParameterCoupon: "ITEM_COU",
            AnalyticsParameterPrice: 9.99,
            AnalyticsParameterIndex: 1,
            AnalyticsParameterQuantity: 1
        ]
        
        // 거래 정보
        let purchaseDict: [String: Any] = [
            AnalyticsParameterTransactionID: "T12345",
            AnalyticsParameterAffiliation: "Google Store",
            AnalyticsParameterCurrency: "USD",
            AnalyticsParameterCoupon: "SUMMER_FUN",
            AnalyticsParameterValue: 14.98,
            AnalyticsParameterTax: 2.58,
            AnalyticsParameterShipping: 5.34,
            AnalyticsParameterItems: [itemDict]
        ]
        
        let gaData = defaultDict.merging(purchaseDict) {(_,new) in new}
        
        // 데이터 전송
        Analytics.logEvent(AnalyticsEventPurchase, parameters: gaData)
    }
}
