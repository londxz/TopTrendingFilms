//
//  MainMovieCellView.swift
//  TopTrendingMovies
//
//  Created by Родион Холодов on 22.11.2024.
//

import UIKit

class MainMovieCellView {
    
    lazy var backView: UIView  = {
        var view = UIView()
        view.translatesAutoresizingMaskIntoConstraints = false
        view.backgroundColor = .systemGray5
        return view
    }()
    
    lazy var imageView: UIImageView = {
        let image = UIImageView()
        image.translatesAutoresizingMaskIntoConstraints = false
        
        return image
    }()
    
    lazy var nameLabel: UILabel = {
        var name = UILabel()
        name.translatesAutoresizingMaskIntoConstraints = false
        name.font = .preferredFont(forTextStyle: .title2)
        name.text = "Name"
        
        return name
    }()
    
    lazy var dateLabel: UILabel = {
        var date = UILabel()
        date.translatesAutoresizingMaskIntoConstraints = false
        date.text = "06/66/6666"
        
        return date
    }()
    
    lazy var rateLabel: UILabel = {
        var rate = UILabel()
        rate.translatesAutoresizingMaskIntoConstraints = false
        rate.font = .preferredFont(forTextStyle: .subheadline)
        rate.text = "10/10"
        
        return rate
    }()
}
