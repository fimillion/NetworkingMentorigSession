// 

import UIKit

final class WelcomeViewController: UIViewController {
    
    override func viewDidLoad() {
        super.viewDidLoad()
        
        title = "Start"
    }
    
        @IBAction func toStudentsDidTap(_ sender: Any) {
        let vc = StudentsViewCoontroller()
        navigationController?.pushViewController(vc, animated: true)
    }
    
    init() {
        super.init(nibName: String(describing: Self.self), bundle: nil)
    }
    
    required init?(coder: NSCoder) {
        fatalError("init(coder:) has not been implemented")
    }
    
    deinit {
        print("DEINIT \(self)")
    }
}
