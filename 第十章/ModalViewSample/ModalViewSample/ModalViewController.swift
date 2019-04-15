//
//  ModalViewController.swift
//  ModalViewSample
//
//  Created by Hao on 2019/4/15.
//  Copyright © 2019年 LIUHAO. All rights reserved.
//

import UIKit

class ModalViewController: UIViewController {

    override func viewDidLoad() {
        super.viewDidLoad()

        // Do any additional setup after loading the view.
    }
    
    @IBAction func save(_ sender: Any) {
        self.dismiss(animated: true) {
            NSLog("点击Save按钮，关闭静态视图")
        }
    }
    
    
    @IBAction func cancel(_ sender: Any) {
        self.dismiss(animated: true) {
            NSLog("点击Cancel按钮，关闭静态视图")
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
