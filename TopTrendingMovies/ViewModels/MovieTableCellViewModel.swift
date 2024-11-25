//
//  MovieTableCellViewModel.swift
//  TopTrendingMovies
//
//  Created by Родион Холодов on 23.11.2024.
//

import Foundation


class MovieTableCellViewModel {
    
    var id: Int
    var title: String
    var date: String
    var rating: String
    var imageUrl: URL?
    
    init(movie: Movie) {
        self.id = movie.id
        self.title = movie.title
        self.date = movie.releaseDate
        self.rating = "\(movie.voteAverage)/10"
        self.imageUrl = makeImageUrl(movie)
    }

    private func makeImageUrl(_ movie: Movie) -> URL? {
        return URL(string: "\(NetworkingConstant.shared.imageServerAdress)\(movie.posterPath)")
    }
}


