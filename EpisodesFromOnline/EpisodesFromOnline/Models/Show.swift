//
//  Show.swift
//  EpisodesFromOnline
//
//  Created by Kimball Yang on 9/13/19.
//  Copyright © 2019 Kimball Yang. All rights reserved.
//

import Foundation

struct Shows: Codable {
    let show: Show?
}

struct Show: Codable {
    let id: Int
    let name: String
    let language: String
    let genres: [String]
    let rating: RatingWrapper?
    let image: ImageWrapper?
}

struct RatingWrapper: Codable {
    let average: Double?
}

struct ImageWrapper: Codable {
    let medium: String
    let original: String
}
