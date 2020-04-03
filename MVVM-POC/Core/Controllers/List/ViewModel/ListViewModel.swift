//
//  ListViewModel.swift
//  MVVM-POC
//
//  Created by Bernardo Silva on 01/04/20.
//  Copyright © 2020 Bernardo. All rights reserved.
//

import Foundation

protocol ListViewModel: class {
    var count: Int {get}
    var coordinatorDelegate: ListViewModelDelegate? { get set }
    var isLoading: Bool {get set}
    func getObject(indexPath: IndexPath) -> CellViewModel
    func fetchObjects(completion: @escaping () -> Void)
    func goToDetail(id: Int)
    func back()
}

extension ListViewModel {
    func back() {
        coordinatorDelegate?.finishCoordinator()
    }
}

struct CellViewModel {
    var title: String
    var subtitle: String
}

protocol ListViewModelDelegate: class {
    func goToDetail(episode: Episode)
    func goToDetail(character: Character)
    func finishCoordinator()
    
}

extension ListViewModelDelegate {
    func goToDetail(episode: Episode){}
    func goToDetail(character: Character){}
}
