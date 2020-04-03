//
//  ListViewController.swift
//  MVVM-POC
//
//  Created by Bernardo Silva on 01/04/20.
//  Copyright © 2020 Bernardo. All rights reserved.
//

import UIKit

class ListViewController: UIViewController, Storyboarded{
    private var loader: UIActivityIndicatorView!
    @IBOutlet private weak var tableView: UITableView!
    
    var viewModel: ListViewModel?
    
    override func viewDidLoad() {
        super.viewDidLoad()
        createLoader()
//        setupBindable()
        setupTableView()
        viewModel?.fetchObjects() {
            DispatchQueue.main.async {
                self.tableView.reloadData()
                self.tableView.isHidden = false
            }
        }
    }
    
    func setupTableView() {
        tableView.delegate = self
        tableView.dataSource = self
    }
    
//    func setupBindable() {
//        guard let viewModel = viewModel else { return }
//        viewModel.isLoading.bind { [weak self](isLoading) in
//            DispatchQueue.main.async {
//                if isLoading {
//                    self?.loader.startAnimating()
//                } else {
//                    self?.loader.stopAnimating()
//                }
//            }
//        }
//    }
    
    override func willMove(toParent parent: UIViewController?) {
        super.willMove(toParent: parent)
        guard parent != nil else {
            viewModel?.back()
            return
        }
    }
    
    func createLoader() {
        loader = UIActivityIndicatorView(style: .gray)
        loader.center = self.view.center
        loader.startAnimating()
        loader.hidesWhenStopped = true
        
        self.view.addSubview(loader)
    }
}

extension ListViewController: UITableViewDelegate, UITableViewDataSource {
    func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
        guard let viewModel = viewModel else { return 0 }
        return viewModel.count
    }
    
    func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
        guard let viewModel = viewModel else { return UITableViewCell() }
        let cell = UITableViewCell.init(style: .subtitle, reuseIdentifier: "test")
        let object = viewModel.getObject(indexPath: indexPath)
        cell.textLabel?.text = object.title
        cell.detailTextLabel?.text = object.subtitle
        return cell
    }
    
    func tableView(_ tableView: UITableView, didSelectRowAt indexPath: IndexPath) {
        viewModel?.goToDetail(id: indexPath.row)
    }
}

extension ListViewController: CharacterListViewModelDelegate {
    func stopLoading() {
        DispatchQueue.main.async {
            self.loader.stopAnimating()
        }
    }
    
    
}
