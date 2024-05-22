//
//  Global.swift
//  IOSBasic
//
//  Created by 박한훈 on 5/20/24.
//

import Foundation
import UIKit
import FirebaseAnalytics

/*
 * 전역 변수 (싱글톤 디자인 패턴)
 * 사용할 때는
 * let global = Global.shared
 * global.purchaseDict
 * 이런 식으로 사용
 */
final class Global: NSObject {
    static let shared = Global()
    
    // 사용자 속성
    var userPropertyDict:[String: Any]!
    // 고정 사용 데이터 (스크린 뷰, 이벤트)
    var defaultDict:[String:Any]!
    // 클릭 이벤트 사용 데이터
    var clickDict:[String:Any]!
    // 상품 선택 사용 데이터
    var proDict:[String:Any]!
    // 상품 정보
    var itemDict:[String: Any]!
    // 주문 정보
    var purchaseDict:[String: Any]!

    private override init() {
        // 사용자 속성
        userPropertyDict = [
            "up_cid": "undefined",
            "up_uid": "undefined",
            "up_type": "개인",
            "up_visit_channel": "APP",
            "up_age": "U",
            "up_gender": "U",
            "up_joindate": "YYYYMMDD",
        ]
        
        // 고정 사용 데이터 (스크린 뷰, 이벤트)
        defaultDict = [
            AnalyticsParameterScreenName:"화면_이름_설정",       // 화면 이름 설정
            AnalyticsParameterScreenClass:"화면_클래스_설정",     // 화면 클래스 설정
            "ep_visit_login_yn":"Y",             // 방문 로그인 여부
            "ep_visit_channel_option":"APP",     // 방문 채널 유형
            
            "ep_visit_channel":"APP",
            "ep_visit_type":"undefined",
            "ep_page_name":"undefined",
    //        "ep_scroll_depth":"undefined",
    //        "ep_gender":"undefined",
    //        "ep_age":"undefined",
            "ep_login_yn":"undefined",
            "ep_dow":"undefined",
        ]
        
        // 클릭 이벤트 사용 데이터
        clickDict = [
            "ep_click_page":"undefined",
    //        "ep_click_area":"undefined",
    //        "ep_click_area2":"undefined",
            "ep_click_label":"undefined",
        ]
        
        // 상품 선택 사용 데이터
        proDict = [
            "ep_prod_type":"undefined",
            "ep_prod_name":"undefined",
        ]
        
        // 상품 정보
        itemDict = [
            AnalyticsParameterItemID: "undefined",         // 상품 ID
            AnalyticsParameterItemName: "undefined", // 상품 이름
            AnalyticsParameterItemCategory: "undefined",  // 상품 카테고리
            AnalyticsParameterItemVariant: "undefined",      // 상품 내 선택 옵션명 또는 옵션 코드 명
            AnalyticsParameterItemBrand: "undefined",      // 상품 브랜드
            AnalyticsParameterCurrency: "USD",          // 통화 코드
            AnalyticsParameterCoupon: "undefined",    // 상품 관련 쿠폰 이름이나 쿠폰 코드
            AnalyticsParameterPrice: 0.0,           // 상품 총 결제 금액
            AnalyticsParameterIndex: 0,                 // 상품 목록에서 상품의 표시 위치
            AnalyticsParameterQuantity: 0               // 상품 수량
        ]
        
        // 거래 정보
        purchaseDict = [
            AnalyticsParameterTransactionID: "undefined",   // 거래 ID
            AnalyticsParameterAffiliation: "undefined",  // 제휴사 또는 오프라인 판매점 정보
            AnalyticsParameterCurrency: "USD",              // 결제 시 사용된 통화 코드
            AnalyticsParameterCoupon: "undefined",           // 구매 시 사용된 쿠폰 이름이나 쿠폰 코드
            AnalyticsParameterValue: 0.0,                 // 거래 시 발생한 매출액 또는 이벤트의 금전적 가치
            AnalyticsParameterTax: 0.0,                     // 해당 거래에서 발생한 세금
            AnalyticsParameterShipping: 0.0,               // 해당 거래에서 발생한 배송비
            AnalyticsParameterItems: [itemDict]             // 해당 거래에서 선택한 결제 수단
        ]
    }
    
    func reset(){
    }
}
