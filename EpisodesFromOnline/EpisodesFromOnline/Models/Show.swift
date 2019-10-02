//
//  Show.swift
//  EpisodesFromOnline
//
//  Created by Kimball Yang on 9/13/19.
//  Copyright © 2019 Kimball Yang. All rights reserved.
//

import Foundation


enum AppError: Error {
    case badJSON
    case networkError
    case noDataError
    case noResponse
    case notFound
    case unauthorized
    case badUrl
    case badHTTPResponse
    case badImageData
}

struct Shows: Codable {
    let show: Show
}

struct Show: Codable {
    let id: Int
    let name: String
    let language: String
    let genres: [String]
    let rating: RatingWrapper?
    let image: ImageWrapper?
    
   static func getShow(urlString: String, completionHandler: @escaping(Result<[Shows], AppError>) -> ()) {
        
        NetworkHelper.manager.getData(urlString: urlString) { (result) in
            switch result {
            case .failure(let error):
                completionHandler(.failure(error))
            case .success(let data):
                do {
                    let shows = try JSONDecoder().decode([Shows].self, from: data)
                    completionHandler(.success(shows))
                } catch {
                    completionHandler(.failure(.badJSON))
                }
            }
        }
        
    }
    
}

struct RatingWrapper: Codable {
    let average: Double?
}

struct ImageWrapper: Codable {
    let medium: String
    let original: String
}
