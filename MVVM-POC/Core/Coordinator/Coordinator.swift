//
//  Coordinator.swift
//  MVVM-POC
//
//  Created by Bernardo Silva on 01/04/20.
//  Copyright © 2020 Bernardo. All rights reserved.
//

import UIKit

protocol Coordinator {
    func startFlow()
}

protocol CoordinatorDelegate {
    func AddCoordinator(coordinator: Coordinator)
}
