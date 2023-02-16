import UIKit

final class PodcastComposer {
    
    static func build (genreId: Int) -> UIViewController {
        let presenter = PodcastPresenter(genreId: genreId)
        let storyboard = UIStoryboard(name: "Main", bundle: nil)
        let storyboardID = String(describing: PodcastViewController.self)
        let controller = storyboard.instantiateViewController(withIdentifier: storyboardID) as! PodcastViewController
        controller.presenter = presenter
        presenter.view = controller
        return controller
    }
}
