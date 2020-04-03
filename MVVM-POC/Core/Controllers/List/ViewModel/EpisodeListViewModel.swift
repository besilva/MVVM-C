//
//  EpisodeListViewModel.swift
//  MVVM-POC
//
//  Created by Bernardo Silva on 03/04/20.
//  Copyright © 2020 Bernardo. All rights reserved.
//

import Foundation

class EpisodeListViewModel: ListViewModel {
    weak var coordinatorDelegate: ListViewModelDelegate?
    
    var isLoading: Bool = false
    var count: Int { return list.count }
    var list: [Episode] = []
    
    func getObject(indexPath: IndexPath) -> CellViewModel {
        let episode = list[indexPath.row]
        return CellViewModel(title: episode.name, subtitle: episode.episode)
    }
    
    func fetchObjects(completion: @escaping () -> Void) {
        let cs = RickAndMortyService()
        isLoading = true
        cs.getAllEpisodes() { (result) in
            switch result {
            case .success(let response):
                self.list = response.results
            case .failure(let error):
                self.list = []
            }
            self.isLoading = false
            completion()
        }
    }
    
    func goToDetail(id: Int) {
        coordinatorDelegate?.goToDetail(episode: list[id])
    }
}
