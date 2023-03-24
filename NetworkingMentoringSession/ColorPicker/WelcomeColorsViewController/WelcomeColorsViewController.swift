// 

import UIKit

final class WelcomeColorsViewController: UIViewController {
    
    override func viewDidLoad() {
        super.viewDidLoad()
        
        title = "Start"
    }
    @IBAction func startColorPickerFlow(_ sender: Any) {
        let vc = ColorSettingsViewController()
        navigationController?.pushViewController(vc, animated: true)
    }
    
    init() {
        super.init(nibName: String(describing: Self.self), bundle: nil)
    }
    
    required init?(coder: NSCoder) {
        fatalError("init(coder:) has not been implemented")
    }
}
