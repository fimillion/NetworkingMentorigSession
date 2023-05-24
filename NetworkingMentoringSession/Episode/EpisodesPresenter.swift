import Foundation

protocol EpisodeView: AnyObject {
    func display(_ episodes: [Episode])
}

final class EpisodePresenter {
    weak var view: EpisodeView?
    private var episodeID: String
    
    init(episodeID: String, view: EpisodeView?) {
        self.episodeID = episodeID
        self.view = view
    }
    
    func onRefresh() {
        let url = URL(string: "https://listen-api-test.listennotes.com/api/v2/podcasts/id=\(episodeID)")
        guard url != nil else {
            return
        }
        var request = URLRequest(url: url!)
        request.httpMethod = "GET"
        let session = URLSession(configuration: .default)
        let task = session.dataTask(with: request) { data, _, _ in
            guard let data = data else { return }
            do {
                let result = try JSONDecoder().decode(EpisodesResult.self, from: data)
                DispatchQueue.main.asyncAfter(deadline: .now() + 1, execute: {
                    self.view?.display(result.episodes)
                })
            } catch {
                DispatchQueue.main.async {
                    print(error)
                }
            }
        }
        task.resume()
    }
}
