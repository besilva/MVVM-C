//
//  EpisodeCoordinator.swift
//  MVVM-POC
//
//  Created by Bernardo Silva on 03/04/20.
//  Copyright © 2020 Bernardo. All rights reserved.
//

import UIKit

class EpisodeCoordinator: Coordinator {
    
    var rootViewController: UINavigationController
    weak var delegate: ListCoordinatorDelegate?
    
    init(rootViewController: UINavigationController = UINavigationController(), delegate: ListCoordinatorDelegate) {
        self.rootViewController = rootViewController
        self.delegate = delegate
    }
    
    func startFlow() {
        let listController = ListViewController.instantiate()
        let viewModel = EpisodeListViewModel()
        viewModel.coordinatorDelegate = self
        listController.viewModel = viewModel
        self.rootViewController.pushViewController(listController, animated: true)
    }
    
    
}

extension EpisodeCoordinator: ListViewModelDelegate {
    func finishCoordinator() {
        delegate?.finishCoordinator()
    }
    
    func goToDetail(episode: Episode) {
        let detailViewModel = DetailViewModel(id: episode.id, name: episode.name, appearences: episode.characters, url: episode.url, created: episode.created)
        let detailController = DetailViewController.instantiate()
        detailController.viewModel = detailViewModel
        self.rootViewController.pushViewController(detailController, animated: true)
        
    }
}
