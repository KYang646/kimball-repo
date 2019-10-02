//
//  SearchBarViewController.swift
//  EpisodesFromOnline
//
//  Created by Kimball Yang on 9/6/19.
//  Copyright © 2019 Kimball Yang. All rights reserved.
//

import UIKit

class SearchBarViewController: UIViewController, UITableViewDataSource, UISearchBarDelegate, UITableViewDelegate {
   
    
  

    var shows = [Shows]() {
        didSet {
            tableView.reloadData()
            
        }
    }
  
    
    var searchTerm: String? = nil {
        didSet {
            guard let searchTerm = searchTerm else {return}
            guard searchTerm != "" else {return}
            let newURL = "http://api.tvmaze.com/search/shows?q=\(searchTerm.lowercased())"
            loadData(url: newURL)
            tableView.reloadData()
        }
    }
    
   

    
    @IBOutlet weak var searchBar: UISearchBar!
    @IBOutlet weak var tableView: UITableView!
   
    
    override func viewDidLoad() {
        super.viewDidLoad()
        tableView.dataSource = self
        tableView.delegate = self
        searchBar.delegate = self
       
        
    }
    
    func loadData(url: String) {
        Show.getShow(urlString: url) { (result) in
                switch result {
                case .failure(let error):
                    print(error)
                case .success(let searchShow) :
                    DispatchQueue.main.async {
                         self.shows = searchShow
                        dump(self.shows)
                    }
                }
            }
    }
    
    
    
    func searchBar(_ searchBar: UISearchBar, textDidChange searchText: String) {
        searchTerm = searchBar.text
    }
    

    
    func tableView(_ tableView: UITableView, heightForRowAt indexPath: IndexPath) -> CGFloat {
      return 200
        }
    
    func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
       return shows.count
    }
    
    func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
        let show = shows[indexPath.row]
        guard let cell = tableView.dequeueReusableCell(withIdentifier: "searchCell", for: indexPath) as? ShowsTableViewCell  else { return UITableViewCell() }
        
        cell.nameLabel.text = show.show.name
        cell.ratingLabel.text = "Rating: \(show.show.rating?.average?.description ?? "None")"
        //cell.showImageView?.image = nil
       
        
        if let imageURL = show.show.image?.original {
                            let setImage: (UIImage)-> Void = {(onlineImage: UIImage) in
                                cell.showImageView.image = onlineImage
                                cell.setNeedsLayout()
                            }
                            ImageAPIClient.manager.getImage(from: imageURL,
                                                            completionHandler: setImage,
                                                            errorHandler: {print($0)})
                        } else {
            cell.showImageView.image = UIImage(named: "aquarius")
                            
                        }
        return cell
    }
    
    

    
    
  
}







