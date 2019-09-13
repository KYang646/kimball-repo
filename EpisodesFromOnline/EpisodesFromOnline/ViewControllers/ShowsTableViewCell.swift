//
//  ShowTableViewCell.swift
//  EpisodesFromOnline
//
//  Created by Kimball Yang on 9/13/19.
//  Copyright © 2019 Kimball Yang. All rights reserved.
//

import UIKit

class ShowsTableViewCell: UITableViewCell {
    
    
    @IBOutlet weak var showImageView: UIImageView!
    
    @IBOutlet weak var nameLabel: UILabel!
    
    @IBOutlet weak var ratingLabel: UILabel!
    
    @IBOutlet weak var spinner: UIActivityIndicatorView!
    
    override func awakeFromNib() {
        super.awakeFromNib()
        spinner.isHidden = true
    }
    
    override func setSelected(_ selected: Bool, animated: Bool) {
        super.setSelected(selected, animated: animated)
        
        // Configure the view for the selected state
    }
    
}
