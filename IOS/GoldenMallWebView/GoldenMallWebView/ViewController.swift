import UIKit
import WebKit
import FirebaseAnalytics

class ViewController: UIViewController, WKNavigationDelegate, WKUIDelegate, WKScriptMessageHandler {
    func userContentController(_ userContentController: WKUserContentController, didReceive message: WKScriptMessage) {
        if message.name == "gascriptCallbackHandler" {
            do{
                let hey = GA4.init()
                try hey.hybridData(message: message)
            }catch let error as NSError {
                print("Failed to load: \(error.localizedDescription)")
            }
            
        }
    
    }
    @IBOutlet var webviewpage: WKWebView!
    override func viewDidLoad() {
        super.viewDidLoad()
        // Do any additional setup after loading the view.
        
        let contentController = WKUserContentController()
        let config = WKWebViewConfiguration()
        
        contentController.add(self, name:"gascriptCallbackHandler")
        
        config.userContentController = contentController
        config.applicationNameForUserAgent = "/GA_iOS_WK"
        
        webviewpage = WKWebView(frame: view.frame, configuration: config)
        webviewpage.removeFromSuperview()
        view.addSubview(webviewpage)
        
        let urlstring = "https://goldenmall.netlify.app/"
        if let url = URL(string: urlstring){
            let urlReq = URLRequest(url: url)
            webviewpage.load(urlReq)
        }
    }
}

