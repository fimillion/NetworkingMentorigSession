//
//  Episode.swift
//  NetworkingMentoringSession
//
//  Created by Yefim on 07.01.2023.
//

import Foundation

struct EpisodesResult: Decodable {
    let episodes: [Episode]
}

// MARK: - Episode
struct Episode: Decodable {
    let id: Int
    let image: String
    let title: String
    let description: String
    init(id: Int, image: String, title: String, description: String) {
        self.id = id
        self.image = image
        self.title = title
        self.description = description
    }

    enum CodingKeys: String, CodingKey {
        case id, image, title, description
    }
}
