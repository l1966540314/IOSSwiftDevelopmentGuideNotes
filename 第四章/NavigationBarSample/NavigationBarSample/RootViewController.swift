//
//  RootViewController.swift
//  NavigationBarSample
//
//  Created by Hao on 2019/3/19.
//  Copyright © 2019年 LIUHAO. All rights reserved.
//

import UIKit

class RootViewController: UIViewController {

    var lable:UILabel!
    override func viewDidLoad() {
        super.viewDidLoad()

        self.view.backgroundColor = UIColor.white
        // Do any additional setup after loading the view.
        
        let navigationBar = UINavigationBar(frame: CGRect(x: 0, y: 20, width: UIScreen.main.bounds.size.width, height: 44.0))
        
        let saveButtonItem = UIBarButtonItem(barButtonSystemItem: UIBarButtonItem.SystemItem.save, target: self, action: #selector(save(_sender:)))
        
        let addButtonItem = UIBarButtonItem(barButtonSystemItem: UIBarButtonItem.SystemItem.add, target: self, action: #selector(add(_sender:)))
        
        let navigationItem = UINavigationItem(title: "")
        navigationItem.leftBarButtonItem = saveButtonItem
        navigationItem.rightBarButtonItem = addButtonItem
        
        navigationBar.items = [navigationItem]
        self.view.addSubview(navigationBar)
        
        self.lable = UILabel(frame: CGRect(x: (UIScreen.main.bounds.size.width - 84)/2.0, y: 198, width: 84, height: 21))
        
        self.lable.text = "Lable"
        
        self.lable.textAlignment = NSTextAlignment.center
        
        self.view.addSubview(self.lable)
        
    }
    
    @objc
    func save(_sender:AnyObject){
        self.lable.text = "点击Save"
    }

    @objc
    func add(_sender:AnyObject){
        self.lable.text = "点击Add"
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
