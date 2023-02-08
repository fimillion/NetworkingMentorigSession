import UIKit

final class PodcastComposer {
    
    static func build (genreId: Int) -> UIViewController {
        let presenter = PodcastPresenter(genreId: genreId)
        let controller = PodcastViewController()
        controller.presenter = presenter
        presenter.view = controller
        return controller
    }
}
