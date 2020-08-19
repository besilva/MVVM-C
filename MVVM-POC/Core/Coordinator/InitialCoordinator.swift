//
//  InitialCoordinator.swift
//  MVVM-POC
//
//  Created by Bernardo Silva on 02/04/20.
//  Copyright © 2020 Bernardo. All rights reserved.
//

import UIKit

protocol InitialCoordinatorDelegate: class {
    func startEpisodesCoordinator()
    func startCharactersCoordinator()
}

class InitialCoordinator: Coordinator {
    
    var rootViewController: UINavigationController
    weak var delegate: InitialCoordinatorDelegate?
    
    init(rootViewController: UINavigationController = UINavigationController(), delegate: InitialCoordinatorDelegate) {
        self.rootViewController = rootViewController
        self.delegate = delegate
        startFlow()
    }
    
    func startFlow() {
        let initialViewController = InitialViewController.instantiate()
        let viewModel = InitialViewModel(delegate: self)
        initialViewController.viewModel = viewModel
        self.rootViewController.pushViewController(initialViewController, animated: true)
    }
    
    func startEpisodesCoordinator() {
        delegate?.startEpisodesCoordinator()
    }
    
    func startCharactersCoordinator() {
        delegate?.startCharactersCoordinator()
    }
    
}

extension InitialCoordinator: InitialViewModelDelegate {
    func goToCharacters() {
        startCharactersCoordinator()
    }
    
    func goToEpisodes() {
        startEpisodesCoordinator()
    }

}
