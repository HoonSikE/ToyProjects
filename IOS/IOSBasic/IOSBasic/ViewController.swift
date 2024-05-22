//
//  ViewController.swift
//  IOSBasic
//
//  Created by 박한훈 on 5/14/24.
//

import UIKit
import FirebaseAnalytics

class ViewController: UIViewController {
    let global = Global.shared

    override func viewDidLoad() {
        super.viewDidLoad()
        // Do any additional setup after loading the view.
    }
    
    override func viewDidAppear(_ animated: Bool) {
        super.viewDidAppear(animated)
        print("메인 화면 출력")
        
        // 스크린뷰 데이터 구성
        global.defaultDict[AnalyticsParameterScreenName] = "메인 화면"
        global.defaultDict[AnalyticsParameterScreenClass] = "ViewController"
        global.defaultDict["ep_page_name"] = "메인 화면"
               
        let gaData = global.defaultDict
                
        Analytics.logEvent(AnalyticsEventScreenView, parameters: gaData)  // 화면 데이터 전송
    }
    
    // 클릭 이벤트
    @IBAction func event_test_button(_ sender: UIButton) {
        print("테스트 이벤트 클릭")
        
        // 클릭 맞춤 이벤트 입력
        global.clickDict["ep_click_page"] = "메인 화면>클릭 테스트"
        global.clickDict["ep_click_label"] = "클릭 이벤트 테스트"

        let gaData = global.defaultDict
            .merging(global.clickDict) {(_,new) in new}
        
        Analytics.logEvent("test_click_event", parameters: gaData)
    }
    
    // 전자 상거래 이동
    @IBAction func move_product_main_button(_ sender: UIButton) {
        print("전자상거래 이동 클릭")

        // 클릭 맞춤 이벤트 입력
        global.clickDict["ep_click_page"] = "메인 화면>페이지 이동"
        global.clickDict["ep_click_label"] = "전자 상거래 페이지 이동"

        let gaData = global.defaultDict
            .merging(global.clickDict) {(_,new) in new}

        Analytics.logEvent("page_move_click_event", parameters: gaData)
    }
}
