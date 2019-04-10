//
//  ViewController.swift
//  TreeNavigation
//
//  Created by Hao on 2019/4/10.
//  Copyright © 2019年 LIUHAO. All rights reserved.
//

import UIKit

class ViewController: UITableViewController {

    var dictData:NSDictionary!
    var listData:NSArray!
    
    
    override func viewDidLoad() {
        super.viewDidLoad()
        // Do any additional setup after loading the view, typically from a nib.
        self.tableView.delegate = self
        self.tableView.dataSource = self
    
        let plistPath = Bundle.main.path(forResource: "provinces_cities", ofType: "plist")
        
        self.dictData = NSDictionary(contentsOfFile: plistPath!)
        self.listData = self.dictData.allKeys as NSArray
        
        self.title = "省份信息"
        
    }


    override func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
        return self.listData.count
    }
    
    override func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
        let cellIdentifier = "CellIdentifier"
        let cell = tableView.dequeueReusableCell(withIdentifier: cellIdentifier, for: indexPath)
        
        let row = indexPath.row
        cell.textLabel?.text = self.listData[row] as? String
        return cell
    }
    
    override func prepare(for segue: UIStoryboardSegue, sender: Any?) {
        if(segue.identifier == "ShowSelectedProvince"){
            let indexPath = self.tableView.indexPathForSelectedRow
            let selectedIndex = indexPath?.row
            
            let citiesViewController:CitiesViewController = segue.destination as! CitiesViewController
            let selectName = self.listData[selectedIndex!]
            citiesViewController.listData = self.dictData[selectName] as? NSArray
            citiesViewController.title = selectName as? String
        }
    }
}

