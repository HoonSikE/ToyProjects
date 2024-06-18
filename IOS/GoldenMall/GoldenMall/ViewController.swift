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
    
}

