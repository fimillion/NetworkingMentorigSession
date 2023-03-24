// 

import UIKit

final class ColorPickerViewController: UIViewController {
    
    @IBOutlet private weak var redButton: UIButton!
    @IBOutlet private weak var greenButton: UIButton!
    @IBOutlet private weak var blueButton: UIButton!
    
    override func viewDidLoad() {
        super.viewDidLoad()
        
        title = "Picker"
        configurePickerViews()
    }
    
    @IBAction func redButtonDidTap(_ sender: Any) {
        print("RED")
    }
    
    @IBAction func greenButtonDidTap(_ sender: Any) {
        print("GREEN")
    }
    
    @IBAction func blueButtonDidTap(_ sender: Any) {
        print("BLUE")
    }
    
    func configurePickerViews() {
        redButton.backgroundColor = .red
        greenButton.backgroundColor = .green
        blueButton.backgroundColor = .blue
    }
    
    init() {
        super.init(nibName: String(describing: Self.self), bundle: nil)
    }
    
    required init?(coder: NSCoder) {
        fatalError("init(coder:) has not been implemented")
    }
}
