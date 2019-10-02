//
//  NetworkHelper.swift
//  EpisodesFromOnline
//
//  Created by Kimball Yang on 9/12/19.
//  Copyright © 2019 Kimball Yang. All rights reserved.
//

import Foundation

class NetworkHelper {
    
    private init() {}
    
    static let manager = NetworkHelper()
    
    func getData(urlString: String, completionHandler: @escaping(Result<Data, AppError>) -> ()) {
        guard let url = URL(string: urlString) else {
            completionHandler(.failure(.badUrl))
            return
        }
        
        URLSession.shared.dataTask(with: url) { (data, response, error) in
            guard error == nil else {
                completionHandler(.failure(.networkError))
                return
            }
            guard let data  = data else {
                completionHandler(.failure(.noDataError))
                return
            }
            
            guard let response = response as? HTTPURLResponse else {
                completionHandler(.failure(.badHTTPResponse))
                return
            }
            
            switch response.statusCode {
            case 404:
                completionHandler(.failure(.notFound))
            case 403:
                completionHandler(.failure(.unauthorized))
            case 401:
                completionHandler(.failure(.unauthorized))
            case 200...299:
                completionHandler(.success(data))
            default:
                completionHandler(.failure(.notFound))
            }
            }.resume()
        
    }
    
    let urlSession = URLSession(configuration: URLSessionConfiguration.default)

    func performDataTask(with url: URL,
                         completionHandler: @escaping ((Data) -> Void),
                         errorHandler: @escaping ((Error) -> Void)) {
        urlSession.dataTask(with: url){(data: Data?, response: URLResponse?, error: Error?) in
            DispatchQueue.main.async {
                guard let data = data else {
                    return
                }
                if let error = error {
                    errorHandler(error)
                }
                completionHandler(data)
                }
            } .resume()
    }

    
    
}

    
