//
//  ViewController.swift
//  TextFieldTextView
//
//  Created by Hao on 2019/3/4.
//  Copyright © 2019年 LIUHAO. All rights reserved.
//

import UIKit

class ViewController: UIViewController,UITextFieldDelegate,UITextViewDelegate {

    override func viewDidLoad() {
        super.viewDidLoad()
        // Do any additional setup after loading the view, typically from a nib.
    }


    func textFieldShouldReturn(_ textField: UITextField) -> Bool {
        NSLog("TextField获得焦点,点击return键")
        return true
    }
    
    func textView(_ textView: UITextView, shouldChangeTextIn range: NSRange, replacementText text: String) -> Bool {
        if(text == "\n"){
            NSLog("TextView获得焦点，点击return键")
            return false
        }
        return true
    }
}

