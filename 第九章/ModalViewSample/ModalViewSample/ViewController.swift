//
//  ViewController.swift
//  ModalViewSample
//
//  Created by Hao on 2019/4/8.
//  Copyright © 2019年 LIUHAO. All rights reserved.
//

import UIKit

class ViewController: UIViewController {

    override func viewDidLoad() {
        super.viewDidLoad()
        // Do any additional setup after loading the view, typically from a nib.
        NotificationCenter.default.addObserver(self, selector: #selector(registerCompletion(_:)), name: NSNotification.Name(rawValue: "RegisterCompletionNotification"), object: nil)
    }


    @objc func registerCompletion(_ notification:Notification){
        let theData = notification.userInfo as! [String : String]
        
        let userName = theData["userName"]
        
        NSLog("username = %@",userName!)
    }
}

