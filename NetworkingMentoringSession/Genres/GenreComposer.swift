import UIKit

final class GenreComposer {
    
    static func build (router: GenreRouter) -> UIViewController {
        let presenter = GenresPresenter()
        let viewController = GenresViewController()
        viewController.presenter = presenter
        presenter.view = viewController as any GenresView
        presenter.router = router
        return viewController
    }
}
