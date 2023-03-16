//
//  HomeViewModel.swift
//  MovieApp
//
//  Created by Nihad Allahveranov on 13.03.23.
//

import Foundation

class HomeViewModel {
    static let shared = HomeViewModel()
    
    private let repo = MovieRepository()
    var movies: [Movie] = []
    
    func fetchMovies(callback: @escaping () -> ()) {
        repo.getMovies { movies in
            self.movies = movies
            callback()
        }
    }
}
