//
//  ColorAPIViewController.swift
//  ParseJSON
//
//  Created by Kimball Yang on 8/27/19.
//  Copyright © 2019 Kimball Yang. All rights reserved.
//

import UIKit

class ColorAPIViewController: UIViewController, UITableViewDelegate, UITableViewDataSource {
    
    @IBOutlet weak var ColorAPITableView: UITableView!
    
    var colorData = [Color]()
        
    
    
    override func viewDidLoad() {
        super.viewDidLoad()
        ColorAPITableView.delegate = self
        ColorAPITableView.dataSource = self
        loadData()
    }
    
    
    private func loadData() {
        guard let pathToJSONFile = Bundle.main.path(forResource: "colorData", ofType: "json") else { fatalError()
        }
        let url = URL(fileURLWithPath: pathToJSONFile)
        do{
            let data = try Data(contentsOf: url)
            self.colorData = try Color.getColorData(from: data)
        } catch {
            print(error)
        }
        
    }
 
    
    func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
        return colorData.count
    }
    
    func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
        //let colorInfo = colorData[indexPath.row]
        let colorCell = ColorAPITableView.dequeueReusableCell(withIdentifier: "colorCell", for: indexPath)
        colorCell.textLabel?.text = colorData[indexPath.row].name.value
        return colorCell
    }
    
    /*
   
 */

}
