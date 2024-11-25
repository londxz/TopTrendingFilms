//
//  DetailsMovieView.swift
//  TopTrendingMovies
//
//  Created by Родион Холодов on 25.11.2024.
//

import UIKit

class DetailsMovieView {

    static let shared = DetailsMovieView()
    private init() {}
    
    lazy var image: UIImageView = {
        let image = UIImageView()
        image.translatesAutoresizingMaskIntoConstraints = false
        
        
        return image
    }()
    
    lazy var nameLabel: UILabel = {
        let label = UILabel()
        label.translatesAutoresizingMaskIntoConstraints = false
        label.textAlignment = .center
        label.numberOfLines = 0
        label.font = .monospacedSystemFont(ofSize: 20, weight: .bold)
        
        return label
    }()
    
    lazy var descriptionLabel: UILabel = {
        let description = UILabel()
        description.translatesAutoresizingMaskIntoConstraints = false
        description.baselineAdjustment = .alignCenters
        description.numberOfLines = 0
        description.font = .monospacedSystemFont(ofSize: 18, weight: .light)
        
       return description
    }()

}
