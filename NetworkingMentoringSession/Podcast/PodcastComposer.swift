//
//  File.swift
//  NetworkingMentoringSession
//
//  Created by Yefim on 01.02.2023.
//

import UIKit

class PodcastComposer {
    
  static func build (genreId: Int) -> UIViewController {
    let presenter = PodcastPresenter(genreId: genreId)
    let controller = PodcastViewController()
    controller.presenter = presenter
    presenter.view = controller
    return controller
  }
}
