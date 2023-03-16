//
//  MovieRepository.swift
//  MovieApp
//
//  Created by Nihad Allahveranov on 16.03.23.
//

import Foundation

class MovieRepository {
    let networkService = NetworkService()
    
    func getMovies(completion: @escaping ([Movie]) -> ()) {
        networkService.requestAllList(MovieResponse().self, endpoint: Endpoint.getList) { response in
            guard let data = response.data else {
                completion([])
                return
            }
            
            if let movies = data.movies {
                completion(movies)
            }
        }
    }
}
