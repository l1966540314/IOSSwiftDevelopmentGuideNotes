//
//  ViewController.swift
//  LongPressGestureRecognizer
//
//  Created by Hao on 2019/4/18.
//  Copyright © 2019年 LIUHAO. All rights reserved.
//

import UIKit

class ViewController: UIViewController {

    var boolTrashEmptyFlag = false
    var imgeTranshFull:UIImage!
    var imgeTrashEmpty:UIImage!
    var imgeView:UIImageView!
    
    
    override func viewDidLoad() {
        super.viewDidLoad()
        // Do any additional setup after loading the view, typically from a nib.
        self.imgeView = UIImageView(frame: CGRect(x: (UIScreen.main.bounds.width - 128)/2.0, y: 148, width: 128, height: 128))
        self.view.addSubview(self.imgeView)
        
        self.imgeTrashEmpty = UIImage(named: "Blend Trash Empty")
        self.imgeTranshFull = UIImage(named: "Blend Trash Full")
        
        self.imgeView.image = self.imgeTranshFull
        
        let recognizer = UILongPressGestureRecognizer(target: self, action: #selector(foundLongPress(_:)))
        recognizer.allowableMovement = 100
        recognizer.minimumPressDuration = 1.0
        self.imgeView.addGestureRecognizer(recognizer)
        
        self.imgeView.isUserInteractionEnabled = true
    }

    @objc
    func foundLongPress(_ sender:UILongPressGestureRecognizer){
        
        
        print("长按state = ",sender.state.rawValue)
        
        if(sender.state == .began){
            if(boolTrashEmptyFlag){
                self.imgeView.image = self.imgeTranshFull
                boolTrashEmptyFlag = false
            }else{
                self.imgeView.image = self.imgeTrashEmpty
                boolTrashEmptyFlag = true
            }
        }
    }

}

