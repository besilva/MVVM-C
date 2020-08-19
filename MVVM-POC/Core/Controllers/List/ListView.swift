//
//  ListView.swift
//  MVVM-POC
//
//  Created by Bernardo Silva on 18/08/20.
//  Copyright © 2020 Bernardo. All rights reserved.
//

import UIKit

class ListView: UIView {
    
    private var loader: UIActivityIndicatorView
    private var tableView: UITableView
    internal var action: (Character) -> Void
    var viewModel: CharacterListViewModel? {
        didSet  {
            self.tableView.reloadData()
        }
    }
    
    init(action: @escaping (Character) -> Void) {
        loader = UIActivityIndicatorView(style: .gray)
        tableView = UITableView()
        self.action = action
        super.init(frame: .zero)
        setupTableView()
        createLoader()
    }
    
    required init?(coder: NSCoder) {
        fatalError("init(coder:) has not been implemented")
    }
    
    func setupTableView() {
        tableView.delegate = self
        tableView.dataSource = self
        self.addSubview(tableView)
        tableView.translatesAutoresizingMaskIntoConstraints = false
        NSLayoutConstraint.activate([
            tableView.topAnchor.constraint(equalToSystemSpacingBelow: self.topAnchor, multiplier: 1),
            tableView.leadingAnchor.constraint(equalTo:self.leadingAnchor),
            tableView.trailingAnchor.constraint(equalTo: self.trailingAnchor),
            tableView.bottomAnchor.constraint(equalToSystemSpacingBelow: self.bottomAnchor, multiplier: 1)
        ])
    }
    
    func createLoader() {
        self.addSubview(loader)
        loader.hidesWhenStopped = true
        loader.center = CGPoint(x: UIScreen.main.bounds.midX, y: UIScreen.main.bounds.midY)
        loader.startAnimating()
    }
    
}

extension ListView: UITableViewDelegate, UITableViewDataSource {
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
        guard let character = viewModel?.getCharacter(id: indexPath.row) else { return }
        action(character)
    }
}

extension ListView: CharacterListViewModelDelegate {
    func stopLoading() {
        DispatchQueue.main.async {
            self.loader.stopAnimating()
        }
    }
    
    
}
