//
//  colorModel.swift
//  ParseJSON
//
//  Created by Kimball Yang on 8/27/19.
//  Copyright © 2019 Kimball Yang. All rights reserved.
//

import UIKit
import Foundation

enum ColorJSON: Error {
    case decodingError(Error)
}


struct Color: Codable {

    let hex: hexWrapper
    let rgb: fractionWrapper
    let name: nameWrapper

    
    static func getColorData(from data: Data) throws -> [Color] {
        do {
            let color = try JSONDecoder().decode([Color].self, from: data)
            return color
        } catch {
            throw ColorJSON.decodingError(error)
        }
    }

}
 


    
struct hexWrapper: Codable {
        let value: String
    }

    struct nameWrapper: Codable {
        let value: String
    }

    struct fractionWrapper: Codable {
        let fraction: rgbWrapper
    }
 
    struct rgbWrapper: Codable {
        let r: Double
        let g: Double
        let b: Double
    }

