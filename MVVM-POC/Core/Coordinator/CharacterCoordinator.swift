//
//  CharacterCoordinator.swift
//  MVVM-POC
//
//  Created by Bernardo Silva on 01/04/20.
//  Copyright © 2020 Bernardo. All rights reserved.
//

import UIKit

protocol ListCoordinatorDelegate: class {
    func finishCoordinator()
}

class CharacterCoordinator: Coordinator {
    
    var rootViewController: UINavigationController
    weak var delegate: ListCoordinatorDelegate?
    
    init(rootViewController: UINavigationController = UINavigationController(), delegate: ListCoordinatorDelegate) {
        self.rootViewController = rootViewController
        self.delegate = delegate
    }
    
    func startFlow() {
        let listController = ListViewController.instantiate()
        let viewModel = CharacterListViewModel()
        viewModel.coordinatorDelegate = self
        viewModel.delegate = listController
        listController.viewModel = viewModel
        self.rootViewController.pushViewController(listController, animated: true)
    }
    
    func didFinish() {
        delegate?.finishCoordinator()
    }
    
}

extension CharacterCoordinator: ListViewModelDelegate {
    func finishCoordinator() {
        delegate?.finishCoordinator()
    }
    
    func goToDetail(character: Character) {
        let detailViewModel = DetailViewModel(id: character.id, name: character.name, appearences: character.episode, url: character.url, created: character.created)
        let detailController = DetailViewController.instantiate()
        detailController.viewModel = detailViewModel
        self.rootViewController.pushViewController(detailController, animated: true)
    }
    
    
}


