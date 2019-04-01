//
//  ViewController.swift
//  IndexTable
//
//  Created by Hao on 2019/4/1.
//  Copyright © 2019年 LIUHAO. All rights reserved.
//

import UIKit

class ViewController: UITableViewController {
    var dictData:NSDictionary!
    var listGroupname:NSArray!
    let CellIdentifier = "CellIdentifier"

    override func viewDidLoad() {
        super.viewDidLoad()
        // Do any additional setup after loading the view, typically from a nib.
        let plistPath = Bundle.main.path(forResource: "team_dictionary", ofType: "plist")
        
        self.dictData = NSDictionary(contentsOfFile: plistPath!)
        
        let tempList:[String] = self.dictData.allKeys as! [String]
        
        print("数据：",tempList)
        
        self.listGroupname = tempList.sorted(by: <) as NSArray
        
        NSLog("排序后：%@", self.listGroupname)
    }


    override func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
        let groupName = self.listGroupname[section]
        
        let listTeams:[String] = self.dictData[groupName] as! [String]
        
        return listTeams.count
    }
    
    override func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
        let cell = tableView.dequeueReusableCell(withIdentifier: CellIdentifier, for: indexPath)
        
        let section = indexPath.section
        
        let row = indexPath.row
        
        let groupName = self.listGroupname[section]
        
        let listTeams = self.dictData[groupName] as! [String]
        
        cell.textLabel?.text = listTeams[row]
        
        return cell
    }
    
    override func numberOfSections(in tableView: UITableView) -> Int {
        return self.listGroupname.count
    }
    
    override func tableView(_ tableView: UITableView, titleForHeaderInSection section: Int) -> String? {
         let groupName = self.listGroupname[section]
         return groupName as? String
    }
    
    override func sectionIndexTitles(for tableView: UITableView) -> [String]? {
        let listTitles = NSMutableArray()
        for item in self.listGroupname as! [String] {
            let title = item.prefix(1)
            listTitles.add(title)
        }
        return listTitles as? [String]
    }
}

