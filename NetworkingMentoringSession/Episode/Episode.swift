import Foundation

struct EpisodesResult: Decodable {
    let episodes: [Episode]
}

struct Episode: Decodable {
    let id: String
    let image: String
    let title: String
    let description: String
    
    enum CodingKeys: String, CodingKey {
        case id, image, title, description
    }
}
