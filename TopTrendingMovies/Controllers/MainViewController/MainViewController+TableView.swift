//
//  MainViewController+TableView.swift
//  TopTrendingMovies
//
//  Created by Родион Холодов on 04.11.2024.
//

import Foundation
import UIKit

extension MainViewController: UITableViewDelegate, UITableViewDataSource {
    
    func configTableView() {
        
        self.tableView.dataSource = self
        self.tableView.delegate = self
        self.tableView.backgroundColor = .clear
        
        self.registerCells()
    }
    
    func registerCells() {
        tableView.register(MainMovieCell.self, forCellReuseIdentifier: MainMovieCell.identifier)
    }

    func reloadTableView() {
        DispatchQueue.main.async {
            self.tableView.reloadData()
        }
    }
    
    func numberOfSections(in tableView: UITableView) -> Int {
        return viewModel.numberOfSections()
    }
    
    func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
        return viewModel.numberOfRows(in: section)
    }
    
    func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
        
        guard let cell = tableView.dequeueReusableCell(withIdentifier: MainMovieCell.identifier, for: indexPath) as? MainMovieCell else {
            return UITableViewCell()
        }
        
        
        let cellViewModel = cellDataSource[indexPath.row]
        print("Configuring cell at row \(indexPath.row) with data: \(cellViewModel.title)")
        cell.setupCell(viewModel: cellViewModel)

        return cell
    }
    
    func tableView(_ tableView: UITableView, heightForRowAt indexPath: IndexPath) -> CGFloat {
        return 150
    }
    
    
}
