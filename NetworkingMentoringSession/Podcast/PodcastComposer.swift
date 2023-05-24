import UIKit

final class PodcastComposer {
    
    static func build (with genreID: Int, router: PodcastRouter) -> UIViewController {
        let viewController = PodcastViewController()
        let presenter = PodcastPresenter(genreID: genreID, view: viewController)
        viewController.presenter = presenter
        presenter.router = router
        return viewController
    }
}
