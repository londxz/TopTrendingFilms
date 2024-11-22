//
//  MainViewView.swift
//  TopTrendingMovies
//
//  Created by Родион Холодов on 04.11.2024.
//

import UIKit

class MainViewView {
    
    // make it singleton
    static var shared = MainViewView()
    private init() {}
    
    lazy var tableView: UITableView = {
       let tbView = UITableView()
        tbView.translatesAutoresizingMaskIntoConstraints = false
        
        
        return tbView
    }()
    
    lazy var activityIndicatorView: UIActivityIndicatorView = {
        let indicator = UIActivityIndicatorView(style: .large)
        indicator.color = .systemGray2
        indicator.translatesAutoresizingMaskIntoConstraints = false
        
        indicator.hidesWhenStopped = true
        
        return indicator
    }()
    
}
