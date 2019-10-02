//
//  URLHelper.swift
//  EpisodesFromOnline
//
//  Created by Kimball Yang on 9/18/19.
//  Copyright © 2019 Kimball Yang. All rights reserved.
//


import Foundation
class UrlHolder {
    let shows = "https://api.tvmaze.com/shows"
    func searchShowsQuery(string: String) -> String {
        return "http://api.tvmaze.com/search/shows?q=\(string.lowercased())"
    }
    func episode(by id: Int) -> String {
        return "http://api.tvmaze.com/shows/\(id)/episodes"
}
}
