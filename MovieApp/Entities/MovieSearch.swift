//
//  MovieSearch.swift
//  MovieApp
//
//  Created by Nihad Allahveranov on 17.03.23.
//

import Foundation

class MovieSearchResponse: Codable {
    var queryString: String?
    var results: [MovieSearch]?
    var errorMessage: String?
}

class MovieSearch: Codable {
    let id: String?
    let image: String?
    let title: String?
    let description: String?
    let runtimeStr: String?
    let genres: String?
    let genreList: [MovieSearchGenreList]?
    let contentRating: String?
    let imDbRating: String?
    let imDbRatingVotes: String?
    let metacriticRating: String?
    let plot: String?
    let stars: String?
    let starList: [MovieSearchStarList]?
}

class MovieSearchGenreList: Codable {
    let key: String?
    let value: String?
}

class MovieSearchStarList: Codable {
    let id: String?
    let name: String?
}
