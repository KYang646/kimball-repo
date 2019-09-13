//
//  ShowAPIClient.swift
//  EpisodesFromOnline
//
//  Created by Kimball Yang on 9/12/19.
//  Copyright © 2019 Kimball Yang. All rights reserved.
//

import Foundation

class ShowAPI{
    private init() {}
    static let manager = ShowAPI()
    func getShow(from urlStr: String,
                 completionHandler: @escaping ([Shows]) -> Void,
                 errorHandler: @escaping (Error) -> Void) {
        guard let url = URL(string: urlStr) else {return}
        let completion: (Data) -> Void = {(data: Data) in
            do {
                let show = try JSONDecoder().decode([Shows].self, from: data)
                completionHandler(show)
            }
            catch let error {
                errorHandler(error)
            }
        }
        NetworkHelper.manager.performDataTask(with: url,
                                              completionHandler: completion,
                                              errorHandler: errorHandler)
    }
}
    

