//
//  LocationListViewModel.swift
//  MVVM-POC
//
//  Created by Bernardo Silva on 03/04/20.
//  Copyright © 2020 Bernardo. All rights reserved.
//

import Foundation

class LocationListViewModel: ListViewModel {
    var count: Int { return list.count }
    weak var delegate: CharacterListViewModelDelegate?
    weak var coordinatorDelegate: ListViewModelDelegate?
    
    var isLoading: Bool = false
    
    func getObject(indexPath: IndexPath) -> CellViewModel {
        let location = list[indexPath.row]
        return CellViewModel(title: location.name ?? "", subtitle: location.url ?? "")
    }
    
    func fetchObjects(completion: @escaping () -> Void) {
        let service = RickAndMortyService()
        service.getAllLocations { (result) in
            print(result)
            switch result {
            case .success(let response):
                self.list = response.results
                completion()
            case .failure(let _):
                self.list = []
            }
            self.delegate?.stopLoading()
        }
    }
    
    func goToDetail(id: Int) {
    }
    
    var list: [Location2] = []
}
