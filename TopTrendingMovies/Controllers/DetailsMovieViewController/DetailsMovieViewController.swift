//
//  DetailsMovieViewController.swift
//  TopTrendingMovies
//
//  Created by Родион Холодов on 25.11.2024.
//

import UIKit
import SDWebImage

class DetailsMovieViewController: UIViewController {
    
    private let build = DetailsMovieView.shared

    var movieImage: UIImageView!
    var movieName: UILabel!
    var movieDescription: UILabel!
    
    let viewModel: DetailsMovieViewModel
    
    init(viewModel: DetailsMovieViewModel) {
        self.viewModel = viewModel
        super.init(nibName: nil, bundle: nil)
    }
    
    required init?(coder: NSCoder) {
        fatalError("init(coder:) has not been implemented")
    }
    
    override func viewDidLoad() {
        super.viewDidLoad()
        setMovieImage()
        setMovieName()
        setMovieLabel()
        configView()
    }
    
    private func setMovieImage() {
        movieImage = build.image
        view.addSubview(movieImage)
        
        NSLayoutConstraint.activate([
            movieImage.topAnchor.constraint(equalTo: view.safeAreaLayoutGuide.topAnchor, constant: 50),
            movieImage.leadingAnchor.constraint(equalTo: view.leadingAnchor, constant: 10),
            movieImage.trailingAnchor.constraint(equalTo: view.trailingAnchor, constant: -10),
            movieImage.heightAnchor.constraint(equalTo: view.heightAnchor, multiplier: 0.25)
        ])
        
    }
    
    private func setMovieName() {
        
        movieName = build.nameLabel
        view.addSubview(movieName)
        
        NSLayoutConstraint.activate([
            movieName.topAnchor.constraint(equalTo: movieImage.bottomAnchor,constant: 15),
            movieName.centerXAnchor.constraint(equalTo: view.centerXAnchor),
            movieName.widthAnchor.constraint(lessThanOrEqualTo: view.widthAnchor, constant: -20)
            
        ])
    }
    
    private func setMovieLabel() {
        
        movieDescription = build.descriptionLabel
        view.addSubview(movieDescription)
        
        NSLayoutConstraint.activate([
            movieDescription.topAnchor.constraint(equalTo: movieName.bottomAnchor, constant: 15),
            movieDescription.leadingAnchor.constraint(equalTo: view.leadingAnchor, constant: 10),
            movieDescription.trailingAnchor.constraint(equalTo: view.trailingAnchor, constant: -10)

        ])
        
    }
    
    private func configView() {
        view.backgroundColor = .white
        self.title = "Movie Details"
        movieImage.sd_setImage(with: viewModel.imageURL)
        movieName.text = viewModel.name
        movieDescription.text = viewModel.description
    }

}
