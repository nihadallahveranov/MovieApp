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
    
    func getSearcedMovies(searchText: String, completion: @escaping ([MovieSearch]) -> ()) {
        networkService.requestAllList(MovieSearchResponse().self, endpoint: Endpoint.getSearchList + searchText) { response in
            if let movies = response.results {
                completion(movies)
            } else {
                print(response.errorMessage ?? "Unknown error")
                completion([])
            }
        }
    }
    
    func getYoutubeVideo(imDbId: String, completion: @escaping (YoutubeTrailer) -> ()) {
        networkService.requestAllList(YoutubeTrailer().self, endpoint: Endpoint.getYoutubeVideo + imDbId) { response in
            print("success repo", response.imDbId)
            completion(response)
        }
    }
}
