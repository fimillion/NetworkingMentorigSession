//
//  GenrePresentor.swift
//  NetworkingMentoringSession
//
//  Created by Yefim on 25.01.2023.
//

import Foundation

protocol GenresView: AnyObject {
    func display(_ genres: [Genre])
    func display(isLoding: Bool)
}

final class GenresPresenter {
    weak  var view: GenresView?
    
    func getGenres() {
        // URL
        view?.display(isLoding: true)
        let url = URL(string: "https://listen-api-test.listennotes.com/api/v2/genres")
        guard url != nil else {
            return
        }
        
        // URL Request
        var request = URLRequest(url: url!)
        request.httpMethod = "GET"
        let session = URLSession(configuration: .default)
        let task = session.dataTask(with: request) { data, _, _ in
            guard let data = data else { return }
            do {
                let result = try JSONDecoder().decode(GenresResult.self, from: data)
                DispatchQueue.main.asyncAfter(deadline: .now() + 1, execute: {
                    self.view?.display(result.genres)
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
