//
//  InitialViewController.swift
//  MVVM-POC
//
//  Created by Bernardo Silva on 02/04/20.
//  Copyright © 2020 Bernardo. All rights reserved.
//

import UIKit

class InitialViewController: UIViewController, Storyboarded {
    
    var viewModel: InitialViewModel?
    

    override func viewDidLoad() {
        super.viewDidLoad()

        // Do any additional setup after loading the view.
    }
    
    override func viewWillDisappear(_ animated: Bool) {
        super.viewWillDisappear(animated)
    }

    override func viewWillAppear(_ animated: Bool) {
        super.viewWillAppear(animated)
    }
    
    @IBAction func charactersButtonTapped(_ sender: Any) {
        viewModel?.goToCharacters()
    }
    
    @IBAction func episodesButtonTapped(_ sender: Any) {
        viewModel?.goToEpisodes()
    }

}
