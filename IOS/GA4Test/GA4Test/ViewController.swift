//
//  ViewController.swift
//  GA4Test
//
//  Created by 박한훈 on 6/23/24.
//

import UIKit
import FirebaseAnalytics

class ViewController: UIViewController {
    let hey = AppInterface.init()
    
    let itemDict1: [String: Any] = [
        AnalyticsParameterItemID: "VANS_12345",
        AnalyticsParameterItemBrand: "Vans",
        AnalyticsParameterItemName: "반스 운동화 올드스쿨 블랙",
        AnalyticsParameterItemVariant: "Black",
        AnalyticsParameterPrice: 18860.0,
        AnalyticsParameterAffiliation: "Golden Mall",
        AnalyticsParameterCoupon: "SUMMER_FUN",
        AnalyticsParameterItemCategory: "Clothes",
        AnalyticsParameterItemCategory2: "Shoes",
        AnalyticsParameterQuantity: 1,
        AnalyticsParameterIndex: 0,
    ]
    let itemDict2: [String: Any] = [
        AnalyticsParameterItemID: "CROCS_67890",
        AnalyticsParameterItemBrand: "Crocs",
        AnalyticsParameterItemName: "바야밴드 클로그",
        AnalyticsParameterItemVariant: "White",
        AnalyticsParameterPrice: 35900.0,
        AnalyticsParameterAffiliation: "Golden Mall",
        AnalyticsParameterCoupon: "SUMMER_FUN",
        AnalyticsParameterItemCategory: "Clothes",
        AnalyticsParameterItemCategory2: "Shoes",
        AnalyticsParameterQuantity: 1,
        AnalyticsParameterIndex: 1,
    ]
    
    let itemDict3: [String: Any] = [
        AnalyticsParameterItemID: "NIKE_369",
        AnalyticsParameterItemBrand: "Nike",
        AnalyticsParameterItemName: "나이키 스우시 반팔",
        AnalyticsParameterItemVariant: "Black/White",
        AnalyticsParameterPrice: 22900.0,
        AnalyticsParameterAffiliation: "Golden Mall",
        AnalyticsParameterItemCategory: "Clothes",
        AnalyticsParameterItemCategory2: "Shirt",
        AnalyticsParameterQuantity: 1,
        AnalyticsParameterIndex: 2,
    ]
    let itemDict4: [String: Any] = [
        AnalyticsParameterItemID: "COMME_777",
        AnalyticsParameterItemBrand: "꼼데가르송",
        AnalyticsParameterItemName: "PLAY 반팔티셔츠",
        AnalyticsParameterItemVariant: "White",
        AnalyticsParameterPrice: 123000.0,
        AnalyticsParameterAffiliation: "Golden Mall",
        AnalyticsParameterItemCategory: "Clothes",
        AnalyticsParameterItemCategory2: "Shirt",
        AnalyticsParameterQuantity: 1,
        AnalyticsParameterIndex: 3,
    ]
    let itemDict5: [String: Any] = [
        AnalyticsParameterItemID: "SAM_111",
        AnalyticsParameterItemBrand: "삼육두유",
        AnalyticsParameterItemName: "검은참깨 두유",
        AnalyticsParameterPrice: 19500.0,
        AnalyticsParameterAffiliation: "Golden Mall",
        AnalyticsParameterItemCategory: "Food",
        AnalyticsParameterItemCategory2: "Drink",
        AnalyticsParameterQuantity: 32,
        AnalyticsParameterIndex: 4,
    ]
    let itemDict6: [String: Any] = [
        AnalyticsParameterItemID: "M_13579",
        AnalyticsParameterItemBrand: "매일유업",
        AnalyticsParameterItemName: "아몬드 브리즈",
        AnalyticsParameterPrice: 21900.0,
        AnalyticsParameterAffiliation: "Golden Mall",
        AnalyticsParameterItemCategory: "Food",
        AnalyticsParameterItemCategory2: "Drink",
        AnalyticsParameterQuantity: 24,
        AnalyticsParameterIndex: 5,
    ]
    
    override func viewDidLoad() {
        super.viewDidLoad()
        // Do any additional setup after loading the view.
    }

    override func viewDidAppear(_ animated: Bool) {
        super.viewDidAppear(animated)
        print("메인 화면 출력")
               
//        let gaData = [
//            "": "",
//        ]
                
//        Analytics.logEvent(AnalyticsEventScreenView, parameters: gaData)  // 화면 데이터 전송
    }
    
    @IBAction func btn_screen_view(_ sender: Any) {
        print("btn_screen_view")
        // 이벤트 매개변수
        let screenDict = [
//            AnalyticsParameterScreenName: "메인>골든몰 홈",
            "title": "메인>골든몰 홈",
            "ep_visit_channel": "IOS",
            "ep_login_yn": "Y",
            "ep_dow": "화",
            
            "up_cid": Analytics.appInstanceID(),
            "up_uid": "hhpark",
            
            "cm_test": "dd",

            "up_type": "개인",
            "up_age": "20",
            "up_gender": "M",
            "up_joindate": "20240604",
        ]

        var gaData: [String: Any] = [ : ].merging(screenDict) {(_,new) in new}
        
        // 사용자 속성
//        Analytics.setUserProperty(Analytics.appInstanceID(), forName: "up_cid")
//        Analytics.setUserProperty("hhpark", forName: "up_uid")
//        Analytics.setUserID("hhparksetUserID")
//        Analytics.setUserProperty("개인", forName: "up_type")
//        Analytics.setUserProperty("20", forName: "up_age")
//        Analytics.setUserProperty("M", forName: "up_gender")
//        Analytics.setUserProperty("20240604", forName: "up_joindate")
        
//        Analytics.logEvent(AnalyticsEventScreenView, parameters: gaData)  // 화면 데이터 전송
        hey.sendGAScreen(gaData)
    }
    
    @IBAction func btn_click_event(_ sender: Any) {
        print("btn_click_event")
        // 이벤트 매개변수
        var eventDict = [
            "event_name": "event_name_test",
            
            "ep_click_page": "이벤트 페이지",
            "ep_click_area": "이벤트 영역",
            "ep_click_area2": "이벤트 영역 2",
            "ep_click_label": "이벤트 테스트 라벨",
        ]

        let gaData: [String: Any] = [ : ].merging(eventDict) {(_,new) in new}
        
//        Analytics.logEvent("event_name_test", parameters: gaData)
        hey.sendGAEvent(gaData)
    }
    
    @IBAction func btn_view_item_list(_ sender: Any) {
        print("btn_view_item_list")
        let transactionDict: [String: Any] = [
            AnalyticsParameterCurrency: "KRW",
        ]
        
        let purchaseDict: [String: Any] = [
            "event_name": AnalyticsEventViewItemList,
            "transaction": transactionDict,
            
            AnalyticsParameterItems: [itemDict1, itemDict2, itemDict3, itemDict4, itemDict5, itemDict6]
        ]
        
        var gaData: [String: Any] = [ : ].merging(purchaseDict) {(_,new) in new}
        
//        Analytics.logEvent(AnalyticsEventViewItemList, parameters: gaData)
        hey.sendGAEcommerce(gaData)
    }
    @IBAction func btn_select_item(_ sender: Any) {
        print("btn_select_item")
        let transactionDict: [String: Any] = [
            AnalyticsParameterCurrency: "KRW",
        ]
        
        let purchaseDict: [String: Any] = [
            "event_name": AnalyticsEventSelectItem,
            "transaction": transactionDict,
            
            AnalyticsParameterCurrency: "KRW",
            AnalyticsParameterItems: [itemDict1]
        ]
        
        var gaData: [String: Any] = [ : ].merging(purchaseDict) {(_,new) in new}
        
//        Analytics.logEvent(AnalyticsEventSelectItem, parameters: gaData)
        hey.sendGAEcommerce(gaData)
    }
    @IBAction func btn_view_item(_ sender: Any) {
        print("btn_view_item")
        let transactionDict: [String: Any] = [
            AnalyticsParameterCurrency: "KRW",
        ]
        
        let purchaseDict: [String: Any] = [
            "event_name": AnalyticsEventViewItem,
            "transaction": transactionDict,
            
            AnalyticsParameterItems: [itemDict1]
        ]
        
        var gaData: [String: Any] = [ : ].merging(purchaseDict) {(_,new) in new}
        
//        Analytics.logEvent(AnalyticsEventViewItem, parameters: gaData)
        hey.sendGAEcommerce(gaData)
    }
    @IBAction func btn_add_to_wishlist(_ sender: Any) {
        print("btn_add_to_wishlist")
        let transactionDict: [String: Any] = [
            AnalyticsParameterCurrency: "KRW",
        ]
        
        let purchaseDict: [String: Any] = [
            "event_name": AnalyticsEventAddToWishlist,
            "transaction": transactionDict,
            
            AnalyticsParameterItems: [itemDict1]
        ]
        
        var gaData: [String: Any] = [ : ].merging(purchaseDict) {(_,new) in new}
        
//        Analytics.logEvent(AnalyticsEventAddToWishlist, parameters: gaData)
        hey.sendGAEcommerce(gaData)
    }
    @IBAction func btn_add_to_cart(_ sender: Any) {
        print("btn_add_to_cart")
        let transactionDict: [String: Any] = [
            AnalyticsParameterCurrency: "KRW",
        ]
        
        let purchaseDict: [String: Any] = [
            "event_name": AnalyticsEventAddToCart,
            "transaction": transactionDict,
            
            AnalyticsParameterItems: [itemDict1]
        ]
        
        var gaData: [String: Any] = [ : ].merging(purchaseDict) {(_,new) in new}
        
//        Analytics.logEvent(AnalyticsEventAddToCart, parameters: gaData)
        hey.sendGAEcommerce(gaData)
    }
    @IBAction func btn_view_cart(_ sender: Any) {
        print("btn_view_cart")
        let transactionDict: [String: Any] = [
            AnalyticsParameterCurrency: "KRW",
        ]
        let purchaseDict: [String: Any] = [
            "event_name": AnalyticsEventViewCart,
            "transaction": transactionDict,
            
            AnalyticsParameterItems: [itemDict1]
        ]
        
        var gaData: [String: Any] = [ : ].merging(purchaseDict) {(_,new) in new}
        
//        Analytics.logEvent(AnalyticsEventViewCart, parameters: gaData)
        hey.sendGAEcommerce(gaData)
    }
    @IBAction func btn_remove_from_cart(_ sender: Any) {
        print("btn_remove_from_cart")
        let transactionDict: [String: Any] = [
            AnalyticsParameterCurrency: "KRW",
        ]
        let purchaseDict: [String: Any] = [
            "event_name": AnalyticsEventRemoveFromCart,
            "transaction": transactionDict,
            
            AnalyticsParameterItems: [itemDict1]
        ]
        
        var gaData: [String: Any] = [ : ].merging(purchaseDict) {(_,new) in new}
        
//        Analytics.logEvent(AnalyticsEventRemoveFromCart, parameters: gaData)
        hey.sendGAEcommerce(gaData)
    }
    @IBAction func btn_begin_checkout(_ sender: Any) {
        print("btn_begin_checkout")
        let transactionDict: [String: Any] = [
            AnalyticsParameterCurrency: "KRW",
        ]
        let purchaseDict: [String: Any] = [
            "event_name": AnalyticsEventBeginCheckout,
            "transaction": transactionDict,
            
            AnalyticsParameterItems: [itemDict1]
        ]
        
        var gaData: [String: Any] = [ : ].merging(purchaseDict) {(_,new) in new}
        
//        Analytics.logEvent(AnalyticsEventBeginCheckout, parameters: gaData)
        hey.sendGAEcommerce(gaData)
    }
    @IBAction func btn_add_shipping_info(_ sender: Any) {
        print("btn_add_shipping_info")
        let transactionDict: [String: Any] = [
            AnalyticsParameterCurrency: "KRW",
            AnalyticsParameterValue: 175860.0,
            AnalyticsParameterShipping: 3000.0,
            AnalyticsParameterPaymentType: "Kakao Pay",
        ]
        let purchaseDict: [String: Any] = [
            "event_name": AnalyticsEventAddShippingInfo,
            "transaction": transactionDict,
            
            AnalyticsParameterItems: [itemDict1, itemDict2]
        ]
        
        var gaData: [String: Any] = [ : ].merging(purchaseDict) {(_,new) in new}
        
//        Analytics.logEvent(AnalyticsEventAddShippingInfo, parameters: gaData)
        hey.sendGAEcommerce(gaData)
    }
    @IBAction func btn_add_payment_info(_ sender: Any) {
        print("btn_add_payment_info")
        let transactionDict: [String: Any] = [
            AnalyticsParameterCurrency: "KRW",
            AnalyticsParameterValue: 175860.0,
            AnalyticsParameterShipping: 3000.0,
            AnalyticsParameterPaymentType: "Kakao Pay",
        ]
        let purchaseDict: [String: Any] = [
            "event_name": AnalyticsEventAddPaymentInfo,
            "transaction": transactionDict,
            
            AnalyticsParameterItems: [itemDict1, itemDict2]
        ]
        
        var gaData: [String: Any] = [ : ].merging(purchaseDict) {(_,new) in new}
        
//        Analytics.logEvent(AnalyticsEventAddPaymentInfo, parameters: gaData)
        hey.sendGAEcommerce(gaData)
    }
    @IBAction func btn_purchase(_ sender: Any) {
        print("btn_purchase")
        // 랜덤 숫자 생성
        let randomNumber = Int.random(in: 0...9)
        // 초기 transaction ID 생성
        let initialTransactionID = "GP-240507"
        // 최종 transaction ID 생성
        let finalTransactionID = "\(initialTransactionID)\(randomNumber)"
        
        let transactionDict: [String: Any] = [
            AnalyticsParameterCurrency: "KRW",
            AnalyticsParameterValue: 175860.0,
            AnalyticsParameterShipping: 3000.0,
            AnalyticsParameterPaymentType: "Kakao Pay",
            AnalyticsParameterTransactionID: finalTransactionID,
        ]
        let purchaseDict: [String: Any] = [
            "event_name": AnalyticsEventPurchase,
            "transaction": transactionDict,
            
            AnalyticsParameterItems: [itemDict1, itemDict2]
        ]
        
        var gaData: [String: Any] = [ : ].merging(purchaseDict) {(_,new) in new}
        
//        Analytics.logEvent(AnalyticsEventPurchase, parameters: gaData)
        hey.sendGAEcommerce(gaData)
    }
    @IBAction func btn_refund(_ sender: Any) {
        print("btn_refund")
        // 랜덤 숫자 생성
        let randomNumber = Int.random(in: 0...9)
        // 초기 transaction ID 생성
        let initialTransactionID = "GP-240507"
        // 최종 transaction ID 생성
        let finalTransactionID = "\(initialTransactionID)\(randomNumber)"
        
        let transactionDict: [String: Any] = [
            AnalyticsParameterCurrency: "KRW",
            AnalyticsParameterValue: 175860.0,
            AnalyticsParameterShipping: 3000.0,
            AnalyticsParameterPaymentType: "Kakao Pay",
            AnalyticsParameterTransactionID: finalTransactionID,
        ]
        
        let purchaseDict: [String: Any] = [
            "event_name": AnalyticsEventRefund,
            "transaction": transactionDict,
            
            AnalyticsParameterItems: [itemDict1, itemDict2]
        ]
        
        var gaData: [String: Any] = [ : ].merging(purchaseDict) {(_,new) in new}
        
//        Analytics.logEvent(AnalyticsEventRefund, parameters: gaData)
        hey.sendGAEcommerce(gaData)
    }
    
}

