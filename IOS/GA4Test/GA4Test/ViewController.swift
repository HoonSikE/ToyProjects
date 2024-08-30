//
//  ViewController.swift
//  GA4Test
//
//  Created by 박한훈 on 6/23/24.
//

import UIKit
import FirebaseAnalytics

class ViewController: UIViewController {
//    var defaultDict: [String: Any] = [:]

    let ga4 = AppInterface.init()
    
    let defaultDict: [String: Any] = [
        "common_data1": "공통 데이터1",
        "common_data2": "공통 데이터2",
        "common_data3": "공통 데이터3",
    ]
    
    let TestDict: [String: Any] = [
        AnalyticsParameterItemID: "ItemID",
        
//        AnalyticsParameterPrice: "",
//        AnalyticsParameterPrice: "Price String",
//        AnalyticsParameterPrice: 12345,
//        AnalyticsParameterPrice: 10.05,
        
//        AnalyticsParameterDiscount: "",
//        AnalyticsParameterDiscount: "Discount String",
//        AnalyticsParameterDiscount: 12345,
//        AnalyticsParameterDiscount: 10.05,
        
//        AnalyticsParameterIndex: "",
//        AnalyticsParameterIndex: "Index String",
//        AnalyticsParameterIndex: 12345,
//        AnalyticsParameterIndex: 10.05,
        
//        AnalyticsParameterQuantity: "",
//        AnalyticsParameterQuantity: "Quantity String",
//        AnalyticsParameterQuantity: 12345,
//        AnalyticsParameterQuantity: 10.05,
        
//        AnalyticsParameterCoupon: "",
//        AnalyticsParameterCoupon: "Coupon String",
//        AnalyticsParameterCoupon: 123456,
//        AnalyticsParameterCoupon: 10.01,
        
//        AnalyticsParameterItemBrand: "",
//        AnalyticsParameterItemBrand: "Brand String",
//        AnalyticsParameterItemBrand: 123456,
//        AnalyticsParameterItemBrand: 10.01,
    ]
    
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
//        let defaultDict = [
//            "title": "화면명",
//            "ep_parameters": "이벤트 매개변수",
//            "up_parameters": "사용자 속성",
//        ]
//        ga4.sendGAScreen(defaultDict)
        
//        let defaultDict = [
//            "title": "화면명",
//
//            "ep_visit_login_yn": "Y",
//            "ep_visit_channel_option": "APP",
//            "up_cid": Analytics.appInstanceID(),
//            "up_uid": "abfw1234ewds"
//        ]
//        ga4.sendGAScreen(defaultDict)
        
//        let dict = [
//            AnalyticsParameterScreenName: "메인 홈",
//            "event_parameter": "이벤트 매개변수",
//        ]
//        
//        Analytics.setUserProperty("사용자 속성", forName: "user_property")
//        Analytics.setUserID("사용자 ID")
//        
//        Analytics.logEvent(AnalyticsEventScreenView, parameters: dict)
    }
    
    @IBAction func btn_screen_view(_ sender: Any) {
        print("btn_screen_view")
        // 이벤트 매개변수
        let screenDict = [
//            AnalyticsParameterScreenName: "메인> 홈",
            "title": "메인> 홈",
            "ep_visit_channel": "IOS",
            "ep_login_yn": "Y",
            "ep_dow": "화",
            
            "up_cid": Analytics.appInstanceID(),
            "up_uid": "hhpark",
            
            "up_type": "개인",
            "up_age": "20",
            "up_gender": "M",
            "up_joindate": "20240604",
        ]

        let gaData: [String: Any] = defaultDict.merging(screenDict as [String : Any]) {(_,new) in new}
        
        // 사용자 속성
//        Analytics.setUserProperty(Analytics.appInstanceID(), forName: "up_cid")
//        Analytics.setUserProperty("hhpark", forName: "up_uid")
//        Analytics.setUserID("hhparksetUserID")
//        Analytics.setUserProperty("개인", forName: "up_type")
//        Analytics.setUserProperty("20", forName: "up_age")
//        Analytics.setUserProperty("M", forName: "up_gender")
//        Analytics.setUserProperty("20240604", forName: "up_joindate")
        
//        Analytics.logEvent(AnalyticsEventScreenView, parameters: [:])  // 화면 데이터 전송
        ga4.sendGAScreen(gaData)

    }
    
    @IBAction func btn_click_event(_ sender: Any) {
        print("btn_click_event")
        // 이벤트 매개변수
        let eventDict = [
            "event_name": "click_event",
            
//            "ep_empty": "",
//            "ep_string": "이벤트 String",
//            "ep_int": 12345,
//            "ep_double": 10.05,
            
//            "cm_empty": "",
//            "cm_string": "이벤트 String",
//            "cm_int": 12345,
//            "cm_double": 10.05,
//            
//            "up_empty": "",
//            "up_string": "이벤트 String",
//            "up_int": 12345,
//            "up_double": 10.05,
        ] as [String : Any]

        let gaData: [String: Any] = defaultDict.merging(eventDict as [String : Any]) {(_,new) in new}

//        Analytics.logEvent("event_name_test", parameters: gaData)
        ga4.sendGAEvent(gaData)
        
        
//        let eventDict = [
//            "event_name": "click_event",
//            "ep_data_click_name": "이벤트 매개변수1",
//            "ep_data_click_area": "이벤트 매개변수2",
//        ]
//        ga4.sendGAEvent(eventDict)
        
//        let eventDict = [
//            "ep_event_category": "category",
//            "ep_event_action": "action",
//            "ep_event_label": "label",
//        ]
//
//        Analytics.logEvent("Test_Event", parameters: eventDict)
        
//        let eventDict2 = [
//            "event_name": "click_event",
//            "ep_button_name": "배너명",
//            "ep_button_area": "메인 배너",
//            "ep_button_category": "쇼핑>홈",
//        ].merging(defaultDict) { (_, new) in new }
        
//        let eventDict3 = defaultDict.merging([
//            "event_name": "click_event",
//            "ep_button_name": "배너명",
//            "ep_button_area": "메인 배너",
//            "ep_button_category": "쇼핑>홈",
//        ]) { (_, new) in new }
        
//        ga4.sendGAEvent(eventDict)
    }
    
    @IBAction func btn_view_item_list(_ sender: Any) {
        print("btn_view_item_list")
        let ecommerceDict: [String: Any] = [
            "event_name": AnalyticsEventViewItemList,
            "cm_first": 1000,
            "cm_second": 5000,
        ]
        let gaData = defaultDict.merging(ecommerceDict) {(_, new) in new}
        
        let transaction: [String: Any] = [
            AnalyticsParameterCurrency: "KRW",
        ]
        let items: [[String: Any]] = [
            itemDict1, itemDict2, itemDict3, itemDict4, itemDict5, itemDict6
        ]
        
        ga4.sendGAEcommerce(gaData, transaction, items)
    }
    @IBAction func btn_select_item(_ sender: Any) {
        print("btn_select_item")
        let ecommerceDict: [String: Any] = [
            "event_name": AnalyticsEventSelectItem,
            "cm_first": 1000,
            "cm_second": 5000,
        ]
        let gaData = defaultDict.merging(ecommerceDict) {(_, new) in new}
        
        let transaction: [String: Any] = [
//            AnalyticsParameterCurrency: "",
            AnalyticsParameterCurrency: "KRW",
//            AnalyticsParameterCurrency: 12345,
//            AnalyticsParameterCurrency: 10.01,

//            AnalyticsParameterTax: "",
//            AnalyticsParameterTax: "Tax String",
            AnalyticsParameterTax: 12345,
//            AnalyticsParameterTax: 10.05,
            
//            AnalyticsParameterShipping: "",
//            AnalyticsParameterShipping: "Shipping String",
            AnalyticsParameterShipping: 12345,
//            AnalyticsParameterShipping: 10.01,
            
//            AnalyticsParameterValue: "",
//            AnalyticsParameterValue: "Value String",
            AnalyticsParameterValue: 45678,
//            AnalyticsParameterValue: 10.01,
        ]
        let items: [[String: Any]] = [
            TestDict, itemDict1,
        ]
        
//        let ecommerce = defaultDict.merging([
//            "event_name": AnalyticsEventSelectItem,
//            "ep_ecommerce1": "Ecommerce",
//        ]) { (_, new) in new }
//
//        let transaction2: [String: Any] = [
//            AnalyticsParameterCurrency: "USD",
//            AnalyticsParameterPrice: 10000,
//            AnalyticsParameterPaymentType: "CARD",
//            AnalyticsParameterTransactionID: "tid-1234",
//        ]
//
//        let item: [String: Any] = [
//            AnalyticsParameterItemID: "CQ_WEJCXIS28",
//            AnalyticsParameterItemName: "T-shirt",
//        ]
//
//        let items: [[String: Any]] = [
//            item
//        ]
//
//        ga4.sendGAEcommerce(gaData, transaction, items)
    }
    @IBAction func btn_view_item(_ sender: Any) {
        print("btn_view_item")
        let ecommerceDict: [String: Any] = [
            "event_name": AnalyticsEventViewItem,
            "cm_first": 1000,
            "cm_second": 5000,
        ]
        let gaData = defaultDict.merging(ecommerceDict) {(_, new) in new}
        
        let transaction: [String: Any] = [
            AnalyticsParameterCurrency: "KRW",
        ]
        let items: [[String: Any]] = [
            itemDict1,
        ]
        
        ga4.sendGAEcommerce(gaData, transaction, items)
    }
    @IBAction func btn_add_to_wishlist(_ sender: Any) {
        print("btn_add_to_wishlist")
        let ecommerceDict: [String: Any] = [
            "event_name": AnalyticsEventAddToWishlist,
            "cm_first": 1000,
            "cm_second": 5000,
        ]
        let gaData = defaultDict.merging(ecommerceDict) {(_, new) in new}
        
        let transaction: [String: Any] = [
            AnalyticsParameterCurrency: "KRW",
        ]
        let items: [[String: Any]] = [
            itemDict1,
        ]
        
        ga4.sendGAEcommerce(gaData, transaction, items)
    }
    @IBAction func btn_add_to_cart(_ sender: Any) {
        print("btn_add_to_cart")
        let ecommerceDict: [String: Any] = [
            "event_name": AnalyticsEventAddToCart,
            "cm_first": 1000,
            "cm_second": 5000,
        ]
        let gaData = defaultDict.merging(ecommerceDict) {(_, new) in new}
        
        let transaction: [String: Any] = [
            AnalyticsParameterCurrency: "KRW",
        ]
        let items: [[String: Any]] = [
            itemDict1,
        ]
        
        ga4.sendGAEcommerce(gaData, transaction, items)
    }
    @IBAction func btn_view_cart(_ sender: Any) {
        print("btn_view_cart")
        let ecommerceDict: [String: Any] = [
            "event_name": AnalyticsEventViewCart,
            "cm_first": 1000,
            "cm_second": 5000,
        ]
        let gaData = defaultDict.merging(ecommerceDict) {(_, new) in new}
        
        let transaction: [String: Any] = [
            AnalyticsParameterCurrency: "KRW",
        ]
        let items: [[String: Any]] = [
            itemDict1,
        ]
        
        ga4.sendGAEcommerce(gaData, transaction, items)
    }
    @IBAction func btn_remove_from_cart(_ sender: Any) {
        print("btn_remove_from_cart")
        let ecommerceDict: [String: Any] = [
            "event_name": AnalyticsEventRemoveFromCart,
            "cm_first": 1000,
            "cm_second": 5000,
        ]
        let gaData = defaultDict.merging(ecommerceDict) {(_, new) in new}
        
        let transaction: [String: Any] = [
            AnalyticsParameterCurrency: "KRW",
        ]
        let items: [[String: Any]] = [
            itemDict1,
        ]
        
        ga4.sendGAEcommerce(gaData, transaction, items)
    }
    @IBAction func btn_begin_checkout(_ sender: Any) {
        print("btn_begin_checkout")
        let ecommerceDict: [String: Any] = [
            "event_name": AnalyticsEventBeginCheckout,
            "cm_first": 1000,
            "cm_second": 5000,
        ]
        let gaData = defaultDict.merging(ecommerceDict) {(_, new) in new}
        
        let transaction: [String: Any] = [
            AnalyticsParameterCurrency: "KRW",
        ]
        let items: [[String: Any]] = [
            itemDict1,
        ]
        
        ga4.sendGAEcommerce(gaData, transaction, items)
    }
    @IBAction func btn_add_shipping_info(_ sender: Any) {
        print("btn_add_shipping_info")
        let ecommerceDict: [String: Any] = [
            "event_name": AnalyticsEventAddShippingInfo,
            "cm_first": 1000,
            "cm_second": 5000,
        ]
        let gaData = defaultDict.merging(ecommerceDict) {(_, new) in new}
        
        let transaction: [String: Any] = [
            AnalyticsParameterCurrency: "KRW",
            AnalyticsParameterValue: 175860.0,
            AnalyticsParameterShipping: 3000.0,
            AnalyticsParameterPaymentType: "Kakao Pay",
        ]
        let items: [[String: Any]] = [
            itemDict1, itemDict2
        ]
        
        ga4.sendGAEcommerce(gaData, transaction, items)
    }
    @IBAction func btn_add_payment_info(_ sender: Any) {
        print("btn_add_payment_info")
        let ecommerceDict: [String: Any] = [
            "event_name": AnalyticsEventAddPaymentInfo,
            "cm_first": 1000,
            "cm_second": 5000,
        ]
        let gaData = defaultDict.merging(ecommerceDict) {(_, new) in new}
        
        let transaction: [String: Any] = [
            AnalyticsParameterCurrency: "KRW",
            AnalyticsParameterValue: 175860.0,
            AnalyticsParameterShipping: 3000.0,
            AnalyticsParameterPaymentType: "Kakao Pay",
        ]
        let items: [[String: Any]] = [
            itemDict1, itemDict2
        ]
        
        ga4.sendGAEcommerce(gaData, transaction, items)
    }
    @IBAction func btn_purchase(_ sender: Any) {
        print("btn_purchase")
        let ecommerceDict: [String: Any] = [
            "event_name": AnalyticsEventPurchase,
            "cm_first": 1000,
            "cm_second": 5000,
        ]
        let gaData = defaultDict.merging(ecommerceDict) {(_, new) in new}
        
        // 랜덤 숫자 생성
        let randomNumber = Int.random(in: 0...9)
        // 초기 transaction ID 생성
        let initialTransactionID = "GP-240507"
        // 최종 transaction ID 생성
        let finalTransactionID = "\(initialTransactionID)\(randomNumber)"
        
        let transaction: [String: Any] = [
            AnalyticsParameterCurrency: "KRW",
            AnalyticsParameterValue: 175860.0,
            AnalyticsParameterShipping: 3000.0,
            AnalyticsParameterPaymentType: "Kakao Pay",
            AnalyticsParameterTransactionID: finalTransactionID,
        ]
        let items: [[String: Any]] = [
            itemDict1, itemDict2
        ]
        
        ga4.sendGAEcommerce(gaData, transaction, items)
        
        
        let ecommerceDict2: [String: Any] = [
            "event_name": AnalyticsEventPurchase,
            "ep_category": "ecommerce",
        ]
        let transaction2: [String: Any] = [
            AnalyticsParameterCurrency: "KRW",
            AnalyticsParameterTransactionID: "Trans_123",
        ]
        let items2: [[String: Any]] = [
            [
                AnalyticsParameterItemID: "Item_123",
                AnalyticsParameterItemBrand: "brand",
                AnalyticsParameterItemName: "ItemName",
                AnalyticsParameterPrice: 12345.0,
            ]
        ]
        ga4.sendGAEcommerce(gaData, transaction, items)
    }
    @IBAction func btn_refund(_ sender: Any) {
        print("btn_refund")
        let ecommerceDict: [String: Any] = [
            "event_name": AnalyticsEventRefund,
            "cm_first": 1000,
            "cm_second": 5000,
        ]
        let gaData = defaultDict.merging(ecommerceDict) {(_, new) in new}
        
        // 랜덤 숫자 생성
        let randomNumber = Int.random(in: 0...9)
        // 초기 transaction ID 생성
        let initialTransactionID = "GP-240507"
        // 최종 transaction ID 생성
        let finalTransactionID = "\(initialTransactionID)\(randomNumber)"
        
        let transaction: [String: Any] = [
            AnalyticsParameterCurrency: "KRW",
            AnalyticsParameterValue: 175860.0,
            AnalyticsParameterShipping: 3000.0,
            AnalyticsParameterPaymentType: "Kakao Pay",
            AnalyticsParameterTransactionID: finalTransactionID,
        ]
        let items: [[String: Any]] = [
            itemDict1, itemDict2
        ]
        
        ga4.sendGAEcommerce(gaData, transaction, items)
    }
    
}

