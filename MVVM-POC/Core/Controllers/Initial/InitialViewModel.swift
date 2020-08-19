//
//  InitialViewModel.swift
//  MVVM-POC
//
//  Created by Bernardo Silva on 02/04/20.
//  Copyright © 2020 Bernardo. All rights reserved.
//

import Foundation

protocol InitialViewModelDelegate: class {
    func goToCharacters()
    func goToEpisodes()
}

class InitialViewModel {
    weak var delegate: InitialViewModelDelegate?
    
    init(delegate: InitialViewModelDelegate) {
        self.delegate = delegate
    }
    
    func goToEpisodes() {
        delegate?.goToEpisodes()
    }
    
    func goToCharacters() {
        delegate?.goToCharacters()
    }

}
