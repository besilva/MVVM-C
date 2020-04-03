//
//  LocationResponse.swift
//  MVVM-POC
//
//  Created by Bernardo Silva on 03/04/20.
//  Copyright © 2020 Bernardo. All rights reserved.
//

import Foundation

// MARK: - LocationResponse
class LocationResponse: Codable {
    let info: Info?
    let results: [Location2]

    init(info: Info, results: [Location2]) {
        self.info = info
        self.results = results
    }
}

// MARK: - Result
class Location2: Codable {
    let id: Int?
    let name: String?
    let airDate, episode: String?
    let characters: [String]?
    let url: String?
    let created: String?

    enum CodingKeys: String, CodingKey {
        case id, name
        case airDate = "air_date"
        case episode, characters, url, created
    }

    init(id: Int, name: String, airDate: String, episode: String, characters: [String], url: String, created: String) {
        self.id = id
        self.name = name
        self.airDate = airDate
        self.episode = episode
        self.characters = characters
        self.url = url
        self.created = created
    }
}
