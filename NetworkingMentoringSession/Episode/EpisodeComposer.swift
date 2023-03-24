import UIKit

final class EpisodeComposer {
    
    static func build(podcastId: String) -> UIViewController {
        let presenter = EpisodePresenter(podcastId: podcastId)
        let controller = EpisodeViewController()
        controller.presenter = presenter
        presenter.view = controller
        return controller
    }
}
