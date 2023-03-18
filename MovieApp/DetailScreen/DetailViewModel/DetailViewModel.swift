//
//  DetailViewModel.swift
//  MovieApp
//
//  Created by Nihad Allahveranov on 18.03.23.
//

import Foundation

class DetailViewModel {
    static let shared = DetailViewModel()
    private let repo: MovieRepository = MovieRepository()
    var youtubeTrailer: YoutubeTrailer?
    
    func fetchYoutubeTrailer(imDbId: String, callback: @escaping () -> ()) {
        repo.getYoutubeVideo(imDbId: imDbId) { youtubeTrailer in
            self.youtubeTrailer = youtubeTrailer
            callback()
        }
    }
}
