//
//  DetailViewController.swift
//  MVVM-POC
//
//  Created by Bernardo Silva on 03/04/20.
//  Copyright © 2020 Bernardo. All rights reserved.
//

import UIKit

class DetailViewController: UIViewController, Storyboarded {
    var viewModel: DetailViewModel?
    
    @IBOutlet weak var urlLabel: UILabel!
    @IBOutlet weak var appearencesLabel: UILabel!
    @IBOutlet weak var createdLabel: UILabel!
    override func viewDidLoad() {
        super.viewDidLoad()
        setupLabels()
    }
    
    func setupLabels() {
        guard let viewModel = viewModel else { return }
        urlLabel.text! += " " + viewModel.url
        appearencesLabel.text! +=  " " + viewModel.appearencesLabel
        createdLabel.text!  += " " + viewModel.created
    }
}
