//
//  EpisodeComposer.swift
//  NetworkingMentoringSession
//
//  Created by Yefim on 03.02.2023.
//

import UIKit

class EpisodeComposer {
  static func build (podcastId: Int) -> UIViewController {
    let presenter = EpisodePresenter.init(podcastId: podcastId)
    let controller = EpisodeTableViewController()
    controller.presenter = presenter
    presenter.view = controller
    return controller
  }
}
