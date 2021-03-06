//
//  AppCoordinator.swift
//  MVVM-POC
//
//  Created by Bernardo Silva on 01/04/20.
//  Copyright © 2020 Bernardo. All rights reserved.
//

import UIKit

class AppCoordinator: NSObject, Coordinator {
    private var coordinators = Stack<Coordinator>()
    
    var rootViewController: UINavigationController
    
    init(rootViewController: UINavigationController) {
        self.rootViewController = rootViewController
    }
    
    internal func startFlow() {
        let coordinator = InitialCoordinator(rootViewController: self.rootViewController, delegate: self)
        self.coordinators.push(coordinator)
    }
    
    func startCharactersCoordinator() {
        let coordinator = CharacterCoordinator(rootViewController: self.rootViewController, delegate: self)
        coordinator.startFlow()
        self.coordinators.push(coordinator)
    }
    
    func startEpisodesCoordinator() {
        // TODO: Implementar
    }

}

extension AppCoordinator: InitialCoordinatorDelegate {}
extension AppCoordinator: ListCoordinatorDelegate {
    func finishCoordinator() {
        _ = self.coordinators.pop()
    }
}
