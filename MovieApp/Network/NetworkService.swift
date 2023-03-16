//
//  NetworkService.swift
//  MovieApp
//
//  Created by Nihad Allahveranov on 16.03.23.
//

import Foundation
import Alamofire

enum Endpoint {
    static let getList = "https://yts.mx/api/v2/list_movies.json?sort=seeds&limit=15" // limit=15
}

class NetworkService {
    func requestAllList<T: Codable>(_ object: T, endpoint: String, comletion: @escaping (T) -> ()) {
        AF.request(endpoint, method: .get).response { response in
            if let data = response.data {
                do {
                    let result = try JSONDecoder().decode(T.self, from: data)
                    comletion(result)
                } catch {
                    print(error.localizedDescription)
                }
            }
        }
    }
}
