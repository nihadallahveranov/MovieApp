//
//  Movie.swift
//  MovieApp
//
//  Created by Nihad Allahveranov on 16.03.23.
//

import Foundation

class MovieResponse: Codable {
    var status: String?
    var statusMessage: String?
    var data: MovieData?
    var meta: Meta?
    
    enum CodingKeys: String, CodingKey {
        case status
        case statusMessage = "status_message"
        case data
        case meta = "@meta"
    }
}

class MovieData: Codable {
    var movieCount: Int?
    var limit: Int?
    var pageNumber: Int?
    var movies: [Movie]?
    
    enum CodingKeys: String, CodingKey {
        case movieCount = "movie_count"
        case limit
        case pageNumber = "page_number"
        case movies
    }
    
}

class Movie: Codable {
    var id: Int?
    var url: String?
    var imdbCode: String?
    var title: String?
    var titleEnglish: String?
    var titleLong: String?
    var slug: String?
    var year: Int?
    var rating: Float?
    var runtime: Int?
    var genres: [String]?
    var summary: String?
    var descriptionFull: String?
    var synopsis: String?
    var ytTrailerCode: String?
    var language: String?
    var mpaRating: String?
    var backgroundImage: String?
    var backgroundImageOriginal: String?
    var smallCoverImage: String?
    var mediumCoverImage: String?
    var largeCoverImage: String?
    var state: String?
    var torrents: [Torrent]?
    var dateUploaded: String?
    var dateUploadedUnix: Int?
    
    enum CodingKeys: String, CodingKey {
        case id
        case url
        case imdbCode = "imdb_code"
        case title
        case titleEnglish = "title_english"
        case titleLong = "title_long"
        case slug
        case year
        case rating
        case runtime
        case genres
        case summary
        case descriptionFull = "description_full"
        case synopsis
        case ytTrailerCode = "yt_trailer_code"
        case language
        case mpaRating = "mpa_rating"
        case backgroundImage = "background_image"
        case backgroundImageOriginal = "background_image_original"
        case smallCoverImage = "small_cover_image"
        case mediumCoverImage = "medium_cover_image"
        case largeCoverImage = "large_cover_image"
        case state
        case torrents
        case dateUploaded = "date_uploaded"
        case dateUploadedUnix = "date_uploaded_unix"
    }
}

class Torrent: Codable {
    var url: String?
    var hash: String?
    var quality: String?
    var type: String?
    var seeds: Int?
    var peers: Int?
    var size: String?
    var sizeBytes: Int?
    var dateUploaded: String?
    var dateUploadedUnix: Int?
    
    enum CodingKeys: String, CodingKey {
        case url
        case hash
        case quality
        case type
        case seeds
        case peers
        case size
        case sizeBytes = "size_bytes"
        case dateUploaded = "date_uploaded"
        case dateUploadedUnix = "date_uploaded_unix"
    }
}

class Meta: Codable {
    var serverTime: Int?
    var serverTimezone: String
    var apiVersion: Int
    var executionTime: String
    
    enum CodingKeys: String, CodingKey {
        case serverTime = "server_time"
        case serverTimezone = "server_timezone"
        case apiVersion = "api_version"
        case executionTime = "execution_time"
    }
}
