//
//  Podcast.swift
//  NetworkingMentoringSession
//
//  Created by Yefim on 02.01.2023.
//

import Foundation

struct PodcastResult: Decodable {
    let podcasts: [Podcast]
}

struct Podcast: Decodable {
    let id: String
    let image: String
    let title: String
    let episodes: [Episode]?
    let description: String

    enum CodingKeys: String, CodingKey {
        case id, image, title, episodes, description
    }
}
