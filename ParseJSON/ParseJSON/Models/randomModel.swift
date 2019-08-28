//
//  randomModel.swift
//  ParseJSON
//
//  Created by Kimball Yang on 8/27/19.
//  Copyright © 2019 Kimball Yang. All rights reserved.
//

import UIKit
import Foundation

enum RandomUserJSON: Error {
    case decodingError(Error)
}

struct RandomUser: Codable {
    let name: String
    
    
}
