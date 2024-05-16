//
//  ResultViewController.swift
//  IOSBasic
//
//  Created by 박한훈 on 5/16/24.
//

import Foundation
import UIKit
import FirebaseAnalytics

/// 컨트롤러 생성
/// https://adjh54.tistory.com/158
class ResultViewController: UIViewController {
    let defaultDict:[String:Any]=[          // 클래스 내 전역 변수 선언
        "ep_visit_login_yn":"Y",            // 방문 로그인 여부
        "ep_visit_channel_option":"APP"     // 방문 채널 유형
    ]

    override func viewDidAppear(_ animated: Bool) {
        super.viewDidAppear(animated)
        /// 스크린뷰 전송 예시
        // 이벤트 매개변수 설정
        Analytics.setUserProperty(Analytics.appInstanceID(), forName:"up_cid2")   // 사용자 속성 설정 (고객_cid)
        Analytics.setUserProperty("사용자 속성2", forName:"up_cid")   // 사용자 속성 설정
        Analytics.setUserID("사용자 ID2")   // 사용자 ID 설정
        
        // 스크린뷰 데이터 구성
        let screenDic:[String: Any] = [
            AnalyticsParameterScreenName:"화면명2",                // 화면 이름 설정
            AnalyticsParameterScreenClass:"ViewController",     // 화면 클래스 설정
        ]
               
        let gaData = defaultDict.merging(screenDic) {(_, new) in new }
        
        Analytics.logEvent(AnalyticsEventScreenView, parameters: gaData)  // 화면 데이터 전송
    }

    override func viewDidLoad() {
        super.viewDidLoad()
    }
    
    @IBAction func button_click(_ sender: UIButton) {
        print("이벤트")
//         맞춤 이벤트 입력
        let eventDict: [String: Any] = [
            "name2": "t_name2",
            "title2": "t_title2"
        ]
        
        Analytics.logEvent("Test_Event2", parameters: eventDict)
    }
}
