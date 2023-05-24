import UIKit

final class EpisodeComposer {
    
    static func build(with podcastID: String) -> UIViewController {
        let viewController = EpisodeViewController()
        let presenter = EpisodePresenter(episodeID: podcastID, view: viewController)
        viewController.presenter = presenter
        presenter.view = viewController
        return viewController
    }
    private init() {}
}
