//
//  LocationCoordinator.swift
//  MVVM-POC
//
//  Created by Bernardo Silva on 03/04/20.
//  Copyright © 2020 Bernardo. All rights reserved.
//

import UIKit

class LocationCoordinator: Coordinator {
    var rootViewController: UINavigationController
    
    init(rootViewController: UINavigationController) {
        self.rootViewController = rootViewController
    }
    
    func startFlow() {
        let listController = ListViewController.instantiate()
        let viewModel = LocationListViewModel()
        listController.viewModel = viewModel
        rootViewController.pushViewController(listController, animated: true)
    }
    
    
}
