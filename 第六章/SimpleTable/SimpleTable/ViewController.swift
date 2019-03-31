//
//  ViewController.swift
//  SimpleTable
//
//  Created by Hao on 2019/3/31.
//  Copyright © 2019年 LIUHAO. All rights reserved.
//

import UIKit

class ViewController: UITableViewController {

    let CellIdentifier = "CellIdentifier"
    var listTeams:NSArray!
    
    
    override func viewDidLoad() {
        super.viewDidLoad()
        // Do any additional setup after loading the view, typically from a nib.
        let plistPath = Bundle.main.path(forResource: "team", ofType: "plist")
        self.listTeams = NSArray(contentsOfFile: plistPath!)
    }


    override func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
        return self.listTeams.count
    }
    
    override func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
        let cell:CustomCell = (tableView.dequeueReusableCell(withIdentifier: CellIdentifier, for: indexPath) as? CustomCell)!
        
        let row = (indexPath as NSIndexPath).row
        
        let rowDict = self.listTeams[row] as! NSDictionary
        cell.myLable.text = rowDict["name"] as? String

        let imageFile = rowDict["image"] as? String

        let imagePath = String(format: "%@.png", imageFile!)

        cell.myImageView.image = UIImage(named: imagePath)
        
        cell.accessoryType = .disclosureIndicator
        
        
        return cell
        
    }
}



