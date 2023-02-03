//
//  EpisodePresenter.swift
//  NetworkingMentoringSession
//
//  Created by Yefim on 25.01.2023.
//

import Foundation

protocol EpisodeView: AnyObject {
    func display(_ episodes: [Episode])
    func display(isLoding: Bool)
}

final class EpisodePresenter {
    weak var view: EpisodeView?
    var podcastId: Int
    init(podcastId: Int) {
        self.podcastId = podcastId
    }
    func onRefresh() {
        // URL
        let url = URL(string: "https://listen-api-test.listennotes.com/api/v2/podcasts/id=\(podcastId)")
        guard url != nil else {
            return
        }
        // Request
        var request = URLRequest(url: url!)
        request.httpMethod = "GET"
        // Session
        let session = URLSession(configuration: .default)
        // dataTask
        let task = session.dataTask(with: request) { data, response, error in
            guard let data = data else { return }
            do {
                let result = try JSONDecoder().decode(EpisodesResult.self, from: data)
                DispatchQueue.main.asyncAfter(deadline: .now() + 1, execute: {
                    self.view?.display(result.episodes)
                    self.view?.display(isLoding: false)
                })
            } catch {
                DispatchQueue.main.async {
                    self.view?.display(isLoding: false)
                }
            }
        }
        task.resume()
    }
}

extension EpisodeTableViewController: EpisodeView {
    func display(_ episode: [Episode]) {
        episodes = episode
        tableView.reloadData()
    }
    func display(isLoding: Bool) {
        if isLoding {
            tableView.refreshControl?.beginRefreshing()
        } else {
            tableView.refreshControl?.endRefreshing()
        }
    }
}
