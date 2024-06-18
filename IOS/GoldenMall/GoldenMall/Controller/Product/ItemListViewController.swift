import UIKit
import FirebaseAnalytics

class ItemListViewController: UIViewController {
    let global = Global.shared

    override func viewDidLoad() {
        super.viewDidLoad()
        // Do any additional setup after loading the view.
    }

    override func viewDidAppear(_ animated: Bool) {
        super.viewDidAppear(animated)
        print("ItemListViewController")
        
    }
}

