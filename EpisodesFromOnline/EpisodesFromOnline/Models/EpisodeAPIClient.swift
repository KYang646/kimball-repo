//
//  EpisodeAPIClient.swift
//  EpisodesFromOnline
//
//  Created by Kimball Yang on 10/3/19.
//  Copyright © 2019 Kimball Yang. All rights reserved.
//
import Foundation

struct EpisodeAPIClient {
    private init() {}
    static let manager = EpisodeAPIClient()
    func getEpisodes(from urlStr: String,
                     completionHandler: @escaping ([Episode]) -> Void,
                     errorHandler: @escaping (Error) -> Void) {
        print(urlStr)
        guard let url = URL(string: urlStr) else {return}
        let completion: (Data) -> Void = {(data: Data) in
            do {
                let onlineEpisodes = try JSONDecoder().decode([Episode].self, from: data)
                completionHandler(onlineEpisodes)
            } catch {
                errorHandler(error)
            }
        }
        NetworkHelper.manager.performDataTask(with: url, completionHandler: completion, errorHandler: errorHandler)
    }
}
