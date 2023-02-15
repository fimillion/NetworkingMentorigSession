import UIKit

final class GenreComposer {
    
    static func build () -> UIViewController {
        let presenter = GenresPresenter()
        let controller = GenresViewController()
        controller.presenter = presenter
        presenter.view = controller
        return controller
    }
}
