//
//  DetailViewController.swift
//  EpisodesFromOnline
//
//  Created by Kimball Yang on 9/6/19.
//  Copyright © 2019 Kimball Yang. All rights reserved.
//

import UIKit

class DetailViewController: UIViewController {

    
    @IBOutlet weak var detImage: UIImageView!
    @IBOutlet weak var detName: UILabel!
    @IBOutlet weak var detSeason: UILabel!
    @IBOutlet weak var detEpNum: UILabel!
    @IBOutlet weak var detTextView: UITextView!
    
    var chosenEpisode: Episode!
    var chosenEpisodeImage: UIImage!
    
    
    override func viewDidLoad() {
        super.viewDidLoad()
        self.detImage.image = chosenEpisodeImage
        self.detName.text = chosenEpisode.name
        self.detSeason.text = "Season: \(chosenEpisode.season)"
        self.detEpNum.text = "Episode: \(chosenEpisode.number)"
        self.detTextView.text = chosenEpisode.summary?.replacingOccurrences(of: "<[^>]+>", with: "", options: String.CompareOptions.regularExpression, range: nil) ?? ""
       
    }
    

    

}
