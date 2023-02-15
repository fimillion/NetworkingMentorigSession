import UIKit

final class GenreComposer {
    
    static func build () -> UIViewController {
        let presenter = GenresPresenter()
        let storyboard = UIStoryboard(name: "Main", bundle: nil)
        let storyboardID = String(describing: GenresViewController.self)
        let controller = storyboard.instantiateViewController(withIdentifier: storyboardID) as! GenresViewController
        controller.presenter = presenter
        presenter.view = controller
        return controller
    }
}
