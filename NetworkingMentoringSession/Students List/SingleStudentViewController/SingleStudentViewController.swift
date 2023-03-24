// 

import UIKit

final class SingleStudentViewController: UIViewController {

    let viewModel = SingleStudentViewModel()
    var studentName: String?
    
    override func viewDidLoad() {
        super.viewDidLoad()
        
        title = "Single screen \(studentName ?? "")"
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

final class SingleStudentViewModel {
    
    deinit {
        print("DEINIT \(self)")
    }
}
