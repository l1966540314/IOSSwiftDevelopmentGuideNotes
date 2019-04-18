//
//  ViewController.swift
//  TapGestureRecognizer
//
//  Created by Hao on 2019/4/16.
//  Copyright © 2019年 LIUHAO. All rights reserved.
//

import UIKit

class ViewController: UIViewController {

    @IBOutlet weak var imgeView: UIImageView!
    
    var boolTrashFull = false
    
    var imgeTrashFull:UIImage!
    
    var imgeTranshEmpty:UIImage!
    
    override func viewDidLoad() {
        super.viewDidLoad()
        // Do any additional setup after loading the view, typically from a nib.
        
        self.imgeTrashFull = UIImage(named: "Blend Trash Full")
        self.imgeTranshEmpty = UIImage(named: "Blend Trash Empty")
        
        self.imgeView.image = self.imgeTrashFull
    }

    @IBAction func foundTap(_ sender: Any) {
        print("Tap")
        
        if(boolTrashFull){
            self.imgeView.image = self.imgeTrashFull
            boolTrashFull = false
        }else{
            self.imgeView.image = self.imgeTranshEmpty
            boolTrashFull = true
        }
    }
    
}

