//
//  RootViewController.swift
//  ToolbarSample
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
        
        let toolbar = UIToolbar(frame: CGRect(x: 0, y: UIScreen.main.bounds.size.height - 44, width: UIScreen.main.bounds.size.width, height: 44))
        
        let saveButtonItem = UIBarButtonItem(barButtonSystemItem: UIBarButtonItem.SystemItem.save, target: self, action: #selector(save(_sender:)))
        
        let openButtonItem = UIBarButtonItem(title: "Open", style: UIBarButtonItem.Style.plain, target: self, action: #selector(open(_sender:)))
        
        let flexibleButtonItem = UIBarButtonItem(barButtonSystemItem: UIBarButtonItem.SystemItem.fixedSpace, target: nil, action: nil)
        
        toolbar.items = [saveButtonItem,flexibleButtonItem,openButtonItem]
        self.view.addSubview(toolbar)
        
        self.lable = UILabel(frame: CGRect(x: (UIScreen.main.bounds.size.width - 84) / 2, y: 250, width: 84, height: 21))
        
        self.lable.text = "Lable"
        
        self.lable.textAlignment = NSTextAlignment.center
        
        self.view.addSubview(self.lable)
    }
    
    @objc
    func save(_sender:AnyObject){
        self.lable.text = "点击Save"
    }
    
    @objc
    func open(_sender:AnyObject){
        self.lable.text = "点击Open"
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
