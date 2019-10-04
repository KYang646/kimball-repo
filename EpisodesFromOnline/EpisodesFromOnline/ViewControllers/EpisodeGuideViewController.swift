//
//  EpisodeGuideViewController.swift
//  EpisodesFromOnline
//
//  Created by Kimball Yang on 9/6/19.
//  Copyright © 2019 Kimball Yang. All rights reserved.
//

import UIKit

class EpisodeGuideViewController: UIViewController {

    @IBOutlet weak var epTableView: UITableView!
    
    
    var chosenShow: Int!
    var episodes = [Episode]() {
        didSet {
            self.epTableView.reloadData()
        }
    }

    private func loadData() {
        
        let urlStr = "http://api.tvmaze.com/shows/\(chosenShow ?? 1)/episodes"
        
        let setEpisodesToOnline: ([Episode]) -> Void = {(onlineEpisodes: [Episode]) in
            self.episodes = onlineEpisodes
        }
        EpisodeAPIClient.manager.getEpisodes(from: urlStr, completionHandler: setEpisodesToOnline, errorHandler: {print($0)})
    }
    
    
    override func viewDidLoad() {
        super.viewDidLoad()
        loadData()
        self.epTableView.delegate = self
        self.epTableView.dataSource = self
    }
    
    override func prepare(for segue: UIStoryboardSegue, sender: Any?) {
        
        guard let destination = segue.destination as? DetailViewController,
        let selectedEpisodeIndex = epTableView.indexPathForSelectedRow else { return
        }
        
        guard let cell = sender as? EpTableViewCell else{return}
        let selectedEpisodeImage = cell.epImage.image
        
        destination.chosenEpisode = episodes[selectedEpisodeIndex.row]
        destination.chosenEpisodeImage = selectedEpisodeImage
    }

   

}

extension EpisodeGuideViewController: UITableViewDataSource, UITableViewDelegate {
    
    func tableView(_ tableView: UITableView, heightForRowAt indexPath: IndexPath) -> CGFloat {
        return 100
    }
    
    func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
        return episodes.count
    }
    
    func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
        let cell = self.epTableView.dequeueReusableCell(withIdentifier: "EpTableViewCell", for: indexPath) as! EpTableViewCell
        let episode = episodes[indexPath.row]
        
        cell.epName.text = episode.name
        cell.epSeasonEpNum.text = "S: \(episode.season) E: \(episode.number)"
        cell.epImage.image = nil
        
        
        if let urlStr = episode.image?.medium {
            let setThumbnailToOnline: (UIImage) -> Void = {(onlineImage: UIImage) in
                cell.epImage.image = onlineImage
        }
            ImageAPIClient.manager.getImage(from: urlStr, completionHandler: setThumbnailToOnline, errorHandler: {print($0)})
        }
        return cell

}
}
