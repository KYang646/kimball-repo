//
//  TVEpisodes.swift
//  EpisodesFromOnline
//
//  Created by Kimball Yang on 10/3/19.
//  Copyright © 2019 Kimball Yang. All rights reserved.
//

import Foundation

struct Episode: Codable {
    let name: String
    let season: Int
    let number: Int
    let image: ImageWrapper?
    let summary: String?
}
