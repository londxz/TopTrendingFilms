//
//  DetailsMovieViewModel.swift
//  TopTrendingMovies
//
//  Created by Родион Холодов on 25.11.2024.
//

import Foundation

class DetailsMovieViewModel {
    
    var movie: Movie
    var movieId: Int
    var name: String
    var description: String
    var imageURL: URL?
    
    init(_ movie: Movie) {
        self.movie = movie
        self.movieId = movie.id
        self.name = movie.title
        self.description = movie.overview
        self.imageURL = makeImageUrl(movie.backdropPath)
    }
    
    private func makeImageUrl(_ imageCode: String) -> URL? {
        print("\(NetworkingConstant.shared.imageServerAdress)\(imageCode)")
        return URL(string: "\(NetworkingConstant.shared.imageServerAdress)\(imageCode)")
    }
    
}
