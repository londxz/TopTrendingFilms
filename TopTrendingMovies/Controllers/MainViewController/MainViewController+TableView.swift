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
        self.tableView.register(UITableViewCell.self, forCellReuseIdentifier: "cell")
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
        let cell = self.tableView.dequeueReusableCell(withIdentifier: "cell", for: indexPath)
        
        var cellContext = cell.defaultContentConfiguration()
        let movieData = cellDataSource[indexPath.row]
        cellContext.text = self.viewModel.getMovieName(movieData)
        cell.contentConfiguration = cellContext
        
        return cell
    }
    
    
}
