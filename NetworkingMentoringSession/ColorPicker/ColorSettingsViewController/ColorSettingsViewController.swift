// 

import UIKit

final class ColorSettingsViewController: UIViewController {
    
    @IBOutlet private weak var resultView: UIView!
    
    override func viewDidLoad() {
        super.viewDidLoad()
        
        title = "Settings"
    }
    
    @IBAction func selectColorDidTap(_ sender: Any) {
        let vc = ColorPickerViewController()
        
        navigationController?.pushViewController(vc, animated: true)
    }
    
    init() {
        super.init(nibName: String(describing: Self.self), bundle: nil)
    }
    
    required init?(coder: NSCoder) {
        fatalError("init(coder:) has not been implemented")
    }
}
