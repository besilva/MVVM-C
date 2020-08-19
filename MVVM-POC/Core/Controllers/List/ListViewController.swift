//
//  ListViewController.swift
//  MVVM-POC
//
//  Created by Bernardo Silva on 01/04/20.
//  Copyright © 2020 Bernardo. All rights reserved.
//

import UIKit

class CharacterListViewController: UIViewController {

    let delegateCoordinator: CharacterListCoordinatorDelegate?
    var theView: ListView {
        return view as! ListView
    }
    
    init(delegate: CharacterListCoordinatorDelegate) {
        delegateCoordinator = delegate
        super.init(nibName: nil, bundle: nil)
        fetchObjects()
    }
    
    required init?(coder: NSCoder) {
        fatalError("init(coder:) has not been implemented")
    }
    
    override func loadView() {
        let view = ListView { (char) in
            self.delegateCoordinator?.goToDetail(character: char)
            return
        }
        self.view = view
        
    }
    
    override func willMove(toParent parent: UIViewController?) {
        super.willMove(toParent: parent)
        guard parent != nil else {
//            viewModel?.back()
            return
        }
    }
    
    func fetchObjects() {
        let cs = RickAndMortyService()
        cs.getAllCharacters { (result) in
            Thread.sleep(forTimeInterval: 2)
            switch result {
            case .success(let response):
                self.updateView(characters: response.results)
            case .failure(let error):
               print(error)
            }
            
        }
    }
    
    func updateView(characters: [Character]) {
        DispatchQueue.main.async {
            let viewModel = CharacterListViewModel(characters: characters, delegate: self.theView)
            self.theView.viewModel = viewModel
        }
    }
    
}


