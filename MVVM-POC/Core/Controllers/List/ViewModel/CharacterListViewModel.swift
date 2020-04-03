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

class CharacterListViewModel: ListViewModel {
    weak var delegate: CharacterListViewModelDelegate?
    weak var coordinatorDelegate: ListViewModelDelegate?
    var isLoading: Bool = false
    var count: Int { return list.count }
    var list: [Character] = []
    
    func getObject(indexPath: IndexPath) -> CellViewModel {
        let character = list[indexPath.row]
        return CellViewModel(title: character.name, subtitle: "\(character.gender)")
    }
    
    func fetchObjects(completion: @escaping () -> Void) {
        let cs = RickAndMortyService()
        isLoading = true
        cs.getAllCharacters { (result) in
            Thread.sleep(forTimeInterval: 2)
            switch result {
            case .success(let response):
                self.list = response.results
            case .failure(let error):
                self.list = []
            }
            self.isLoading = false
            self.delegate?.stopLoading()
            completion()
        }
    }
    
    func goToDetail(id: Int) {
        coordinatorDelegate?.goToDetail(character: list[id])
    }
}
