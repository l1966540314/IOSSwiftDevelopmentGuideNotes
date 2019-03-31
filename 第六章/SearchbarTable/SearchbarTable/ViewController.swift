//
//  ViewController.swift
//  SearchbarTable
//
//  Created by Hao on 2019/3/31.
//  Copyright © 2019年 LIUHAO. All rights reserved.
//

import UIKit

class ViewController: UITableViewController,UISearchBarDelegate,UISearchResultsUpdating {
    
    let CellIdentifier = "CellIdentifier"
    
    var searchController:UISearchController!
    
    var listTeams:NSArray!
    
    var listFilterTeams:NSMutableArray!

    override func viewDidLoad() {
        super.viewDidLoad()
        // Do any additional setup after loading the view, typically from a nib.
        let plistPath = Bundle.main.path(forResource: "team", ofType: "plist")
        self.listTeams = NSArray(contentsOfFile: plistPath!)
        
        filterContentForSearchText("", scope: -1)
        
        self.searchController = UISearchController(searchResultsController: nil)
        
        self.searchController.searchResultsUpdater = self
        
        self.searchController.dimsBackgroundDuringPresentation = false
        
        self.searchController.searchBar.scopeButtonTitles = ["中文","英文"]
        
        self.searchController.searchBar.delegate = self
        
        self.tableView.tableHeaderView = self.searchController.searchBar
        
        self.searchController.searchBar.sizeToFit()
        
    }

    func filterContentForSearchText(_ searchText:NSString ,scope:Int){
        if(searchText.length == 0){
            self.listFilterTeams = NSMutableArray.init(array: self.listTeams)
            return
        }
        var scopePredicate:NSPredicate
        var tempArray:NSArray!
        
        switch scope {
        case 0:
            scopePredicate = NSPredicate(format: "SELF.name contains[c] %@", searchText)
            tempArray = self.listTeams.filtered(using: scopePredicate) as NSArray
            self.listFilterTeams = NSMutableArray.init(array: tempArray)
            break
        case 1:
            scopePredicate = NSPredicate(format: "SELF.image contains[c] %@", searchText)
            tempArray = self.listTeams.filtered(using: scopePredicate) as NSArray
            self.listFilterTeams = NSMutableArray.init(array: tempArray)
            break
        default:
            self.listFilterTeams = NSMutableArray(array: self.listTeams)
            break
            
        }
    }

    func searchBar(_ searchBar: UISearchBar, selectedScopeButtonIndexDidChange selectedScope: Int) {
        updateSearchResults(for: self.searchController)
    }
    
    func updateSearchResults(for searchController: UISearchController) {
        let searchString = searchController.searchBar.text
        filterContentForSearchText(searchString! as NSString, scope: searchController.searchBar.selectedScopeButtonIndex)
        self.tableView.reloadData()
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

