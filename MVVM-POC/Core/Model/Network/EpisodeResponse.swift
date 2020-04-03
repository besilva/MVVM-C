//
//  EpisodeResponse.swift
//  MVVM-POC
//
//  Created by Bernardo Silva on 01/04/20.
//  Copyright © 2020 Bernardo. All rights reserved.
//

import Foundation

// MARK: - Episode
class EpisodeResponse: Codable {
    let info: Info
    let results: [Episode]

    init(info: Info, results: [Episode]) {
        self.info = info
        self.results = results
    }
}
