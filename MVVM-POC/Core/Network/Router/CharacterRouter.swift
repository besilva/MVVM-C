//
//  CharacterRouter.swift
//  MVVM-POC
//
//  Created by Bernardo Silva on 01/04/20.
//  Copyright © 2020 Bernardo. All rights reserved.
//

import Foundation

enum CharacterRouter: Router {
    case getAllEpisodes
    case getAllCharacters
    case getCharacter(id: Int)
    case getAllLocations
    
    var host: String { return "rickandmortyapi.com"}
    
    var path: String {
        switch self {
        case .getAllEpisodes:
            return "/api/episode/"
        case .getAllCharacters:
            return "/api/character/"
        case .getCharacter(let id):
            return "/api/character/\(id)"
        case .getAllLocations:
            return "/api/location/"
        }
    }
    
    var parameters: [URLQueryItem] {
        switch self {
        case .getAllEpisodes, .getAllCharacters, .getCharacter, .getAllLocations:
            return []
        }
    }
    
    var method: String {
        switch self {
        case .getAllCharacters, .getAllEpisodes, .getCharacter, .getAllLocations:
            return "GET"
        }
    }
    
}
