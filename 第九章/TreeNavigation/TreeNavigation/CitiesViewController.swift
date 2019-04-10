//
//  CitiesViewController.swift
//  TreeNavigation
//
//  Created by Hao on 2019/4/10.
//  Copyright © 2019年 LIUHAO. All rights reserved.
//

import UIKit

class CitiesViewController: UITableViewController {

    public var listData:NSArray!
    
    override func viewDidLoad() {
        super.viewDidLoad()

        // Do any additional setup after loading the view.
    }
    
    override func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
        return self.listData.count
    }

    override func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
        let cellIndentifier = "CellIdentifier"
        let cell = tableView.dequeueReusableCell(withIdentifier: cellIndentifier, for: indexPath)
        
        let row = indexPath.row
        let dict = self.listData[row] as! NSDictionary
        
        cell.textLabel?.text = dict["name"] as? String
        
        return cell
    }
    
    override func prepare(for segue: UIStoryboardSegue, sender: Any?) {
        if(segue.identifier == "ShowSelectedCity"){
            let indexPath = self.tableView.indexPathForSelectedRow
            let selectedIndex = indexPath?.row
            
            let dict = self.listData[selectedIndex!] as! NSDictionary
            
            let detailViewController = segue.destination as! DetailViewController
            detailViewController.url = dict["url"] as? String
            detailViewController.title = dict["name"] as? String
        }
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
