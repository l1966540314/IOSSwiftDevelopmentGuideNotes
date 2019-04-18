//
//  ViewController.swift
//  PanGestureRecognizer
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
        self.imgeView.backgroundColor = UIColor.yellow
        self.view.addSubview(self.imgeView)
        
        self.imgeTrashEmpty = UIImage(named: "Blend Trash Empty")
        self.imgeTranshFull = UIImage(named: "Blend Trash Full")
        
        self.imgeView.image = self.imgeTranshFull
        
        let recognizer = UIPanGestureRecognizer(target: self, action: #selector(foundPan(_:)))

        recognizer.minimumNumberOfTouches = 1
        recognizer.maximumNumberOfTouches = 1

        self.imgeView.addGestureRecognizer(recognizer)
        self.imgeView.isUserInteractionEnabled = true
    }


    @objc
    func foundPan(_ sender:UIPanGestureRecognizer){
        print("拖动 state = ",sender.state.rawValue)
        
        if(sender.state != .ended && sender.state != .failed){
            let location = sender.location(in: sender.view?.superview)
            sender.view?.center = location
        }
    }
}

