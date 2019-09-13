//
//  SearchBarViewController.swift
//  EpisodesFromOnline
//
//  Created by Kimball Yang on 9/6/19.
//  Copyright © 2019 Kimball Yang. All rights reserved.
//

import UIKit

class SearchBarViewController: UIViewController, UITableViewDataSource, UISearchBarDelegate, UITableViewDelegate {
    
    
    
    func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
        return shows.count
    }
    
    func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
        let show = shows[indexPath.row]
        let cell = tableView.dequeueReusableCell(withIdentifier: "ShowCell", for: indexPath)
        if let cell = cell as? ShowsTableViewCell{
            guard let show = show.show else {return cell}
            cell.nameLabel.text = show.name
            cell.ratingLabel.text = "Rating: \(show.rating?.average?.description ?? "None")"
            cell.showImageView?.image = nil //stop flickering
            cell.spinner.isHidden = false
            cell.spinner.startAnimating()
            
            if let imageURL = show.image?.original {
                let setImage: (UIImage)-> Void = {(onlineImage: UIImage) in
                    cell.showImageView?.image = onlineImage
                    cell.setNeedsLayout()
                    cell.spinner.stopAnimating()
                    cell.spinner.isHidden = true
                }
                ImageAPIClient.manager.getImage(from: imageURL,
                                                completionHandler: setImage,
                                                errorHandler: {print($0)})
            } else {
                cell.showImageView.image = #imageLiteral(resourceName: "noImage")
                cell.spinner.isHidden = true
                cell.spinner.stopAnimating()
            }
        }
        return cell
    }
    
    var searchTerm = "" {
        didSet {
            loadData()
        }
    }
    
    func searchBarSearchButtonClicked(_ searchBar: UISearchBar) {
        self.searchTerm = (searchBar.text?.components(separatedBy: " ").joined(separator: "%20"))!
    }
    
    func scrollViewWillBeginDragging(_ scrollView: UIScrollView) {
        searchBar.endEditing(true)
    }

    
    
    
    
    //    func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
    //        <#code#>
    //    }
    //
    //    func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
    //        <#code#>
    //    }
    
    
    @IBOutlet weak var searchBar: UISearchBar!
    @IBOutlet weak var tableView: UITableView!
    
    var shows = [Shows]() {
        didSet {
            tableView.reloadData()
            
        }
    }
    
    
    
    func tableView(_ tableView: UITableView, heightForRowAt indexPath: IndexPath) -> CGFloat {
        return 300
    }
    
    func loadData() {
        let urlStr = "http://api.tvmaze.com/search/shows?q=\(self.searchTerm)"
        let completion: ([Shows]) -> Void = {(onlineShows: [Shows]) in
            self.shows = onlineShows
        }
        ShowAPI.manager.getShow(from: urlStr, completionHandler: completion, errorHandler: {print($0)})
    }
    
    override func viewDidLoad() {
        super.viewDidLoad()
        tableView.dataSource = self
        tableView.delegate = self
        searchBar.delegate = self
        searchBar.resignFirstResponder()
        
        
        
        
    }
}




//    func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
//        return shows.count
//    }



// extension SearchBarViewController {


