//
//  episodes.swift
//  Aug27
//
//  Created by Kimball Yang on 8/27/19.
//  Copyright © 2019 Kimball Yang. All rights reserved.
//

import Foundation

enum JSONError: Error {
    case decodingError(Error)
}

struct Episode: Codable {
    let name: String
    let summary: String
    let number: Int
    let runtime: Int
    let image: ImageWrapper
    
    private enum CodingKeys: String CodingKey {
        case name, summary, number, runtime, image, link = "_links.self.href"
    }
    
    
    static func getEpisodes(from data: Data) throws -> [Episode] {
        do {
            let episodes = try JSONDecoder().decode([Episode].self, from: data)
            return episodes
        } catch {
            throw JSONError.decodingError(<#T##Error#>)
        }
    }

}

struct ImageWrapper {
    let medium = String
    let original = String
    
}
