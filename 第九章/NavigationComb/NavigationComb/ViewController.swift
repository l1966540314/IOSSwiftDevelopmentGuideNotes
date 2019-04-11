//
//  ViewController.swift
//  NavigationComb
//
//  Created by Hao on 2019/4/11.
//  Copyright © 2019年 LIUHAO. All rights reserved.
//

import UIKit

class ViewController: UITableViewController {

    var dictData:NSDictionary!
    var listData:NSArray!
    
    override func viewDidLoad() {
        super.viewDidLoad()
        // Do any additional setup after loading the view, typically from a nib.
        let plistPath = Bundle.main.path(forResource: "provinces_cities", ofType: "plist")
        
        self.dictData = NSDictionary(contentsOfFile: plistPath!)
        
        let navigationController = self.parent
        
        let selectProvinces = navigationController?.tabBarItem.title
        
        if(selectProvinces == "黑龙江"){
            self.listData = self.dictData["黑龙江省"] as? NSArray
            self.navigationItem.title = "黑龙江省信息"
        }else if(selectProvinces == "吉林"){
            self.listData = self.dictData["吉林省"] as? NSArray
            self.navigationItem.title = "吉林省信息"
        }else if(selectProvinces == "辽宁"){
            self.listData = self.dictData["辽宁省"] as? NSArray
            self.navigationItem.title = "辽宁省信息"
        }
    }


    override func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
        return self.listData.count
    }
    
    override func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
        let cellIdentifie = "CellIdentifie"
        let cell = tableView.dequeueReusableCell(withIdentifier: cellIdentifie, for: indexPath)
        let row = indexPath.row
        let dict = self.listData[row] as! NSDictionary
        cell.textLabel?.text = dict["name"] as? String
        return cell
    }
    
    override func prepare(for segue: UIStoryboardSegue, sender: Any?) {
        if(segue.identifier == "ShowDetail"){
            let indexPath = self.tableView.indexPathForSelectedRow
            let selectIndex = indexPath?.row
            
            let dict = self.listData[selectIndex!] as! NSDictionary
            
            let detailViewController = segue.destination as! DetailViewController
            detailViewController.url = dict["url"] as? NSString
            detailViewController.title = dict["name"] as? String
            
        }
    }
}

