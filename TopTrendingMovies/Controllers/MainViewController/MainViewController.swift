//
//  MainViewController.swift
//  TopTrendingMovies
//
//  Created by Родион Холодов on 04.11.2024.
//

import UIKit

class MainViewController: UIViewController {
    
    // reference to view
    private let build = MainViewView.shared
    
    // reference to viewModel
    var viewModel: MainViewModel = MainViewModel()
    
    // vars lets
    var tableView = UITableView()
    
    override func viewDidLoad() {
    
        setTableView()
        configView()
    }
    
    override func viewDidAppear(_ animated: Bool) {
        viewModel.getData()
    }
    private func setTableView() {
        tableView = build.tableView
        view.addSubview(tableView)
        
        NSLayoutConstraint.activate([
            tableView.topAnchor.constraint(equalTo: view.safeAreaLayoutGuide.topAnchor),
            tableView.bottomAnchor.constraint(equalTo: view.bottomAnchor),
            tableView.leadingAnchor.constraint(equalTo: view.leadingAnchor),
            tableView.trailingAnchor.constraint(equalTo: view.trailingAnchor)
        ])
    }
    
    private func configView() {
        view.backgroundColor = .white
        self.title = "Fist screen"
        setupTableView()
    }
}
