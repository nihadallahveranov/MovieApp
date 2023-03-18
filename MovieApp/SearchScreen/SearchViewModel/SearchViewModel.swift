//
//  SearchViewModel.swift
//  MovieApp
//
//  Created by Nihad Allahveranov on 15.03.23.
//

import Foundation

class SearchViewModel {
    private let repo = MovieRepository()
    var movies: [MovieSearch] = []
    
    func fetchMovies(searchText: String, callback: @escaping () -> ()) {
        repo.getSearcedMovies(searchText: searchText) { movies in
            self.movies = movies
            callback()
        }
    }

}

