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
    var indicator: UIActivityIndicatorView!
    var cellDataSource: [Movie] = []
    
    override func viewDidLoad() {
    
        configView()
        bindViewModel()
    }
    
    override func viewDidAppear(_ animated: Bool) {
        super.viewDidAppear(animated)
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
    
    private func setupActivityIndicator() {
        indicator = build.activityIndicatorView
        view.addSubview(indicator)
        
        NSLayoutConstraint.activate([
            indicator.centerXAnchor.constraint(equalTo: view.centerXAnchor),
            indicator.centerYAnchor.constraint(equalTo: view.centerYAnchor)

        ])
    }
    
    private func configView() {
        view.backgroundColor = .white
        self.title = "Fist screen"
        setTableView()
        configTableView()
        setupActivityIndicator()
    }
    
    private func bindViewModel() {
        viewModel.isLoading.bind { [weak self] isLoading in
            guard let self = self, let isLoading = isLoading else {
                return
            }
            DispatchQueue.main.async {
                if isLoading {
                    self.indicator.startAnimating()
                } else {
                    self.indicator.stopAnimating()
                }
            }
        }
        viewModel.cellDataSource.bind { [weak self] movies in
            guard let self = self, let movies = movies else {
                return
            }
            self.cellDataSource = movies
            self.reloadTableView()
        }
    }
}
