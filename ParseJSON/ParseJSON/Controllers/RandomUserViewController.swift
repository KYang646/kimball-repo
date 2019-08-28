//
//  RandomUserViewController.swift
//  ParseJSON
//
//  Created by Kimball Yang on 8/27/19.
//  Copyright © 2019 Kimball Yang. All rights reserved.
//

import UIKit

class RandomUserViewController: UIViewController, UITableViewDelegate {

    @IBOutlet weak var RandomUserViewTable: UITableView!
    
    
    override func viewDidLoad() {
        super.viewDidLoad()
        RandomUserViewTable.delegate = self
//        RandomUserViewTable.dataSource = self

        // Do any additional setup after loading the view.
    }
    

    /*
    // MARK: - Navigation

    // In a storyboard-based application, you will often want to do a little preparation before navigation
    override func prepare(for segue: UIStoryboardSegue, sender: Any?) {
        // Get the new view controller using segue.destination.
        // Pass the selected object to the new view controller.
    }
    */

}
