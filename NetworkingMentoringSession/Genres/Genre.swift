//
//  Genre.swift
//  NetworkingMentoringSession
//
//  Created by Yefim on 02.01.2023.
//

import Foundation

struct GenresResult: Decodable {
    let genres: [Genre]
}

struct Genre: Decodable {
    let id: Int
    let name: String
    let parentID: Int
    
    private enum CodingKeys: String, CodingKey {
        case id
        case name
        case parentID = "parent_id"
    }
}
