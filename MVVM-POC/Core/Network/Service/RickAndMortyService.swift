//
//  RickAndMortyService.swift
//  MVVM-POC
//
//  Created by Bernardo Silva on 01/04/20.
//  Copyright © 2020 Bernardo. All rights reserved.
//

import Foundation

class RickAndMortyService: BaseService {

    func getAllCharacters(router: CharacterRouter = CharacterRouter.getAllCharacters, completion: @escaping (Result<CharacterResponse, Error>) -> ()) {
        return self.request(router: router, completion: completion)
    }
    
    func getCharacter(id: Int,
                      completion: @escaping (Result<CharacterResponse, Error>) -> ()) {
        let router = CharacterRouter.getCharacter(id: id)
        return self.request(router: router, completion: completion)
    }
    
    func getAllEpisodes(router: CharacterRouter = CharacterRouter.getAllEpisodes,
                        completion: @escaping (Result<EpisodeResponse, Error>) -> ()) {
        return self.request(router: router, completion: completion)
    }

}
