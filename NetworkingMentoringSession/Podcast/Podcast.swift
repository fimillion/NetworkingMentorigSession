//
//  Podcast.swift
//  NetworkingMentoringSession
//
//  Created by Yefim on 02.01.2023.
//

import Foundation

// MARK: - PodcastResult
struct PodcastResult: Decodable {
    let podcasts: [Podcast]
}
// MARK: - Podcast
struct Podcast: Decodable {
    let id: Int
    let image: String
    let title: String
    let episodes: [Episode]?
    let description: String

    enum CodingKeys: String, CodingKey {
        case id, image, title, episodes, description
    }
}
