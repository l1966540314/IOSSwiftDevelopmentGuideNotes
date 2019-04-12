//
//  DetailViewController.swift
//  SplitViewSample
//
//  Created by Hao on 2019/4/12.
//  Copyright © 2019年 LIUHAO. All rights reserved.
//

import UIKit

class DetailViewController: UIViewController {

    var selectRow = 0


   

    override func viewDidLoad() {
        super.viewDidLoad()
        // Do any additional setup after loading the view, typically from a nib.
        
        NSLog("选择的行号：%i", selectRow)
        
        if(self.selectRow == 0){
            let blueViewController = self.storyboard?.instantiateViewController(withIdentifier: "blueViewConroller")
            self.addChild(blueViewController!)
            self.view.addSubview((blueViewController?.view)!)
        }else{
            let yellowViewController = self.storyboard?.instantiateViewController(withIdentifier: "yellowViewController")
            self.addChild(yellowViewController!)
            self.view.addSubview((yellowViewController?.view)!)
        }
    }


}

