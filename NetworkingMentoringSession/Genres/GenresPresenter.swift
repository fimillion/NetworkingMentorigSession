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

class GenresPresentor {
    
    // Lick on View
    weak  var view: GenresView?

    func onRefresh() {
        
        // URL
        view?.display(isLoding: true)
        let url = URL(string: "https://listen-api-test.listennotes.com/api/v2/genres")
        guard url != nil else {
            print("Errore creating url odject")
            return
        }
        
        // URL Request
        var request = URLRequest(url: url!)
        request.httpMethod = "GET"
        
        let session = URLSession(configuration: .default)
        let task = session.dataTask(with: request) { data, response, error in
            guard let data = data else { return }
                        
            do {
                let result = try JSONDecoder().decode(GenresResult.self, from: data)
                print("DECODING RESULT \(result)")
                
                DispatchQueue.main.asyncAfter(deadline: .now() + 1, execute: {
                    self.view?.display(result.genres)
                    self.view?.display(isLoding: false)
                })
                
            } catch {
                print("DECODING ERROR \(error)")
                DispatchQueue.main.async {
                    self.view?.display(isLoding: false)
                }
            }
        }
        task.resume()
    }
    func onSelect(_ genre: Genre) {
        print("Selected \(genre)")
    }
}

extension ViewController: GenresView {
    
    func display(_ genres: [Genre]) {
        models = genres
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
    


