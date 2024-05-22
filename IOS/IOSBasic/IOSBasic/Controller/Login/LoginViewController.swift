//
//  LoginViewController.swift
//  IOSBasic
//
//  Created by 박한훈 on 5/16/24.
//

import Foundation
import UIKit
import FirebaseAnalytics

/// 컨트롤러 생성
/// https://adjh54.tistory.com/158
class LoginViewController: UIViewController {
    let global = Global.shared

    override func viewDidAppear(_ animated: Bool) {
        super.viewDidAppear(animated)
        print("로그인 화면 출력")
        
        // 스크린뷰 데이터 구성
        global.defaultDict[AnalyticsParameterScreenName] = "로그인 화면"
        global.defaultDict[AnalyticsParameterScreenClass] = "LoginViewController"
        global.defaultDict["ep_page_name"] = "로그인 화면"
         
        let gaData = global.defaultDict

        Analytics.logEvent(AnalyticsEventScreenView, parameters: gaData)  // 화면 데이터 전송
    }

    // 로그인 버튼
    @IBAction func login_button(_ sender: UIButton) {
        print("로그인 버튼 클릭")
        
        // 클릭 맞춤 이벤트 입력
        global.clickDict["ep_click_page"] = "로그인 화면>로그인"
        global.clickDict["ep_click_label"] = "로그인"
        
        // 사용자 속성 일괄 정의
        setUserProperty()
        // 이벤트 파라미터 정의
        setEventParameter()
        
        let gaData = global.defaultDict
            .merging(global.clickDict) {(_,new) in new}
            .merging(global.userPropertyDict) {(_, new) in new }
        
        Analytics.logEvent("login_click_event", parameters: gaData)
    }
    
    // 사용자 속성 일괄 정의
    func setUserProperty(){
        print("사용자 속성 일괄 정의")

        global.userPropertyDict["up_cid"] = Analytics.appInstanceID()
        global.userPropertyDict["up_uid"] = "admin"
        global.userPropertyDict["up_type"] = "개인"
        global.userPropertyDict["up_visit_channel"] = "APP"
        global.userPropertyDict["up_age"] = "20대"
        global.userPropertyDict["up_gender"] = "M"
        global.userPropertyDict["up_joindate"] = "20240507"
        
        // 사용자 속성
        // Analytics.setUserProperty(String value, forName: String key)
        Analytics.setUserProperty(Analytics.appInstanceID(), forName:"up_cid")
        Analytics.setUserProperty(global.userPropertyDict["up_uid"] as? String, forName:"up_uid")
        Analytics.setUserProperty(global.userPropertyDict["up_type"] as? String, forName:"up_type")
        Analytics.setUserProperty(global.userPropertyDict["up_visit_channel"] as? String, forName:"up_visit_channel")
        Analytics.setUserProperty(global.userPropertyDict["up_age"] as? String, forName:"up_age")
        Analytics.setUserProperty(global.userPropertyDict["up_gender"] as? String, forName:"up_gender")
        Analytics.setUserProperty(global.userPropertyDict["up_joindate"] as? String, forName:"up_joindate")
        
        // 사용자 ID 구현
        Analytics.setUserID(global.userPropertyDict["up_uid"] as? String)
    }
    // 이벤트 파라미터 정의
    func setEventParameter(){
        print("이벤트 파라미터 정의")
        
        global.defaultDict["ep_visit_login_yn"] = "Y"
        global.defaultDict["ep_visit_channel_option"] = "APP"
        
        global.defaultDict["ep_visit_channel"] = "APP"
        global.defaultDict["ep_visit_type"] = "개인"
//        global.defaultDict["ep_scroll_depth"] = "0%"
//        global.defaultDict["ep_gender"] = "M"
//        global.defaultDict["ep_age"] = "20대"
        global.defaultDict["ep_login_yn"] = "Y"
        global.defaultDict["ep_dow"] = "수"
    }
}
