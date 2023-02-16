import UIKit

final class EpisodeComposer {
    
  static func build (podcastId: String) -> UIViewController {
    let presenter = EpisodePresenter(podcastId: podcastId)
      let storyboard = UIStoryboard(name: "Main", bundle: nil)
      let storyboardID = String(describing: EpisodeViewController.self)
      let controller = storyboard.instantiateViewController(withIdentifier: storyboardID) as! EpisodeViewController
    controller.presenter = presenter
    presenter.view = controller
    return controller
  }
}
