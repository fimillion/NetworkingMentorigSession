//
//  PocastPresenter.swift
//  NetworkingMentoringSession
//
//  Created by Yefim on 25.01.2023.
//

import Foundation

protocol PodcastView: AnyObject {
    func display(_ podcasts: [Podcast])
    func display(isLoding: Bool)
}

final class PodcastPresenter {
    weak  var view: PodcastView?
    var genreId: Int
    
    init(genreId: Int) {
        self.genreId = genreId
    }
    func getPodcasts() {
        view?.display(isLoding: true)
        var components = URLComponents()
        components.scheme = "https"
        components.host = "listen-api-test.listennotes.com"
        components.path = "/api/v2/best_podcasts"
        components.queryItems = [
            URLQueryItem(name: "genre_id", value: String(genreId))
        ]
        let request = URLRequest(url: components.url!)
        print(components.url!)
        // Create the Send
        let session = URLSession(configuration: .default)
        let task = session.dataTask(with: request) { data, response, error in
            guard let data = data else { return }
        
            do {
                let result = try JSONDecoder().decode(PodcastResult.self, from: data)
                DispatchQueue.main.asyncAfter(deadline: .now() + 1, execute: {
                    self.view?.display(result.podcasts)
                    self.view?.display(isLoding: false)
                })
            } catch {
                DispatchQueue.main.async {
                    print("PARSING_ERROR \(error)")
                    self.view?.display(isLoding: false)
                }
            }
        }
        task.resume()
    }
    func onSelect(_ genre: Genre) {
    }
}
