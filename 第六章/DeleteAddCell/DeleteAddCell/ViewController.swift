//
//  ViewController.swift
//  DeleteAddCell
//
//  Created by Hao on 2019/4/3.
//  Copyright © 2019年 LIUHAO. All rights reserved.
//

import UIKit

class ViewController: UITableViewController, UITextFieldDelegate {

    @IBOutlet var textField: UITextField!
    
    var listTeams:NSMutableArray!
    
    var Logs:NSMutableArray!
    
    override func viewDidLoad() {
        super.viewDidLoad()
        // Do any additional setup after loading the view, typically from a nib.
        self.navigationItem.rightBarButtonItem = self.editButtonItem
        
        self.navigationItem.title = "单元格插入和删除"
        
        self.textField.isHidden = true
        
        self.textField.delegate = self
        
        self.listTeams = NSMutableArray(array: ["黑龙江","吉林","辽宁"])
        
        self.Logs = NSMutableArray()
        
        let date = Date()
        
        self.Logs.add(date)
        
        let rc = UIRefreshControl()
        
        rc.attributedTitle = NSAttributedString(string: "下拉刷新")
        
        rc.addTarget(self, action: #selector(refreshTableView), for: UIControl.Event.valueChanged)
        
        self.refreshControl = rc
    }

    @objc
    func refreshTableView(){
        if(self.refreshControl?.isRefreshing == true){
            self.refreshControl?.attributedTitle = NSAttributedString(string: "加载中...")
            
            let date = Date()
            self.Logs.add(date)
            
            sleep(UInt32(0.25))
            self.refreshControl?.endRefreshing()
            self.refreshControl?.attributedTitle = NSAttributedString(string: "下拉刷新")
            
            self.tableView.reloadData()
        }
    }

    override func setEditing(_ editing: Bool, animated: Bool) {
        super.setEditing(editing, animated: animated)
        
        self.tableView.setEditing(editing, animated: animated)
        
        if(editing){
            self.textField.isHidden = false
        }else{
            self.textField.isHidden = true
        }
    }
    
    override func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
        return self.listTeams.count + 1
    }
    
    override func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
        let cellIndentifier = "CellIdentifier"
        
        let b_addCell = (indexPath.row == self.listTeams.count);
        
        let cell = tableView.dequeueReusableCell(withIdentifier: cellIndentifier, for: indexPath)
        
        if(!b_addCell){
            cell.accessoryType = .disclosureIndicator;
            cell.textLabel?.text = self.listTeams[indexPath.row] as? String
        }else{
            self.textField.frame = CGRect(x: 40, y: 0, width: 300, height: cell.frame.size.height)
            self.textField.borderStyle = .none
            self.textField.placeholder = "Add...."
            self.textField.text = ""
            cell.addSubview(self.textField)
        }
        return cell
    }
    
    override func tableView(_ tableView: UITableView, editingStyleForRowAt indexPath: IndexPath) -> UITableViewCell.EditingStyle {
        if(indexPath.row == self.listTeams.count){
            return .insert
        }else{
            return .delete
        }
//        return .none
    }
    
    override func tableView(_ tableView: UITableView, commit editingStyle: UITableViewCell.EditingStyle, forRowAt indexPath: IndexPath) {
        let indexPaths = NSArray(object: indexPath)
        
        if(editingStyle == .delete){
           self.listTeams.removeObject(at: indexPath.row)
            self.tableView.deleteRows(at: indexPaths as! [IndexPath], with: UITableView.RowAnimation.fade)
        }else if(editingStyle == .insert){
            self.listTeams.insert(self.textField.text!, at: self.listTeams.count)
            self.tableView.insertRows(at: indexPaths as! [IndexPath], with: UITableView.RowAnimation.fade)
        }
        
        self.tableView.reloadData()
    }
    
    override func tableView(_ tableView: UITableView, shouldHighlightRowAt indexPath: IndexPath) -> Bool {
        if(indexPath.row == self.listTeams.count){
           return false
        }else{
            return true
        }
    }
    
    override func tableView(_ tableView: UITableView, canMoveRowAt indexPath: IndexPath) -> Bool {
        return true
    }
    
    override func tableView(_ tableView: UITableView, moveRowAt sourceIndexPath: IndexPath, to destinationIndexPath: IndexPath) {
        let stringToMove = self.listTeams[sourceIndexPath.row]
        
        self.listTeams.removeObject(at: sourceIndexPath.row)
        
        self.listTeams.insert(stringToMove, at: destinationIndexPath.row)
    }
}

