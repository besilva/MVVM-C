//
//  CharacterListViewModel.swift
//  MVVM-POC
//
//  Created by Bernardo Silva on 01/04/20.
//  Copyright © 2020 Bernardo. All rights reserved.
//

import Foundation

protocol  CharacterListViewModelDelegate: class{
    func stopLoading()
   
}

protocol CharacterListCoordinatorDelegate: class {
    func finishCoordinator()
    func goToDetail(character: Character)
}

struct CellViewModel {
    var title: String
    var subtitle: String
}

class CharacterListViewModel {
    
    weak var delegate: CharacterListViewModelDelegate?
    var isLoading: Bool = false
    var count: Int { return list.count }
    var list: [Character] = []
    
    init(characters: [Character], delegate: CharacterListViewModelDelegate) {
        self.list = characters
        self.delegate = delegate
        self.delegate?.stopLoading()
    }
    
    func getObject(indexPath: IndexPath) -> CellViewModel {
        let character = list[indexPath.row]
        return CellViewModel(title: character.name, subtitle: "\(character.gender)")
    }
    
    func getCharacter(id: Int) -> Character {
        return list[id]
    }
}
