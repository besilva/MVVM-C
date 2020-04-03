//
//  CharacterResponse.swift
//  MVVM-POC
//
//  Created by Bernardo Silva on 01/04/20.
//  Copyright © 2020 Bernardo. All rights reserved.
//

import Foundation

// MARK: - CharacterResponse
class CharacterResponse: Codable {
    let info: Info
    let results: [Character]

    init(info: Info, results: [Character]) {
        self.info = info
        self.results = results
    }
}
