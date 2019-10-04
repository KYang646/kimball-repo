//
//  EpTableViewCell.swift
//  EpisodesFromOnline
//
//  Created by Kimball Yang on 10/3/19.
//  Copyright © 2019 Kimball Yang. All rights reserved.
//

import UIKit

class EpTableViewCell: UITableViewCell {

    @IBOutlet weak var epImage: UIImageView!
    
    @IBOutlet weak var epName: UILabel!
    @IBOutlet weak var epSeasonEpNum: UILabel!
    
    
    
    
    
    
    
    override func awakeFromNib() {
        super.awakeFromNib()
        // Initialization code
    }

    
    
    
    override func setSelected(_ selected: Bool, animated: Bool) {
        super.setSelected(selected, animated: animated)

        // Configure the view for the selected state
    }

}
