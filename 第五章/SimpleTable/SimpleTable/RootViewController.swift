//
//  RootViewController.swift
//  SimpleTable
//
//  Created by Hao on 2019/3/28.
//  Copyright © 2019年 LIUHAO. All rights reserved.
//

import UIKit

class RootViewController: UIViewController,UITableViewDelegate,UITableViewDataSource {
    func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
        return self.listTeams.count
    }
    
    func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
//        var cell = talbeView.dequeueReusableCell(withIdentifier: CellIdentifier)
//        if(cell == nil){
//            cell = UITableViewCell.init(style: UITableViewCell.CellStyle.default, reuseIdentifier: CellIdentifier)
//        }
        let cell:CustomCell = tableView.dequeueReusableCell(withIdentifier: CellIdentifier, for: indexPath) as! CustomCell
        let row = indexPath.row
        let rowDict = self.listTeams[row] as!NSDictionary
//        cell?.textLabel?.text = rowDict["name"] as? String
//        let imagePath = NSString(format: "%@.png", rowDict["imge"]!)
//        cell?.imageView?.image = UIImage.init(named: imagePath as String)
//        cell?.textLabel?.backgroundColor = rowDict["imge"] as? UIColor
        cell.accessoryType = UITableViewCell.AccessoryType.disclosureIndicator
        cell.myLable.text = rowDict["name"] as? String
        cell.myImgeView.backgroundColor = rowDict["imge"] as? UIColor
        return cell
    }
    
    let CellIdentifier = "CellIdentifier"
    let itmeNum = 20
    var listTeams:NSArray!
    var talbeView:UITableView!

    override func viewDidLoad() {
        super.viewDidLoad()

        // Do any additional setup after loading the view.
//        let plistPath = Bundle.main.path(forResource: "team", ofType: "plist")
//        self.listTeams = NSArray(contentsOfFile: plistPath!)
        let tableList = NSMutableArray()
        for i in 0..<itmeNum {
            let dic:[String:AnyObject] = [
                "imge":UIColor(red: CGFloat(Float(arc4random()%255)/255.0), green: CGFloat(Float(arc4random()%255)/255.0), blue: CGFloat(Float(arc4random()%255)/255.0), alpha: 1.0),
                "name" : NSString(format: "第%d个", i + 1)
            ]
            tableList.add(dic)
        }
        
        self.listTeams = NSArray(array: tableList)
        self.talbeView = UITableView(frame: self.view.frame, style: UITableView.Style.plain)
        self.talbeView.register(CustomCell.self, forCellReuseIdentifier: CellIdentifier)
        self.talbeView.delegate = self
        self.talbeView.dataSource = self
        self.view.addSubview(self.talbeView)
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
