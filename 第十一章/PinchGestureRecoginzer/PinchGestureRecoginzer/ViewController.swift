//
//  ViewController.swift
//  PinchGestureRecoginzer
//
//  Created by Hao on 2019/4/19.
//  Copyright © 2019年 LIUHAO. All rights reserved.
//

import UIKit

class ViewController: UIViewController {

    var currentScale = 1.0
    
    var imgeTranshFull:UIImage!
    var imgeView:UIImageView!
    
    override func viewDidLoad() {
        super.viewDidLoad()
        // Do any additional setup after loading the view, typically from a nib.
        self.imgeView = UIImageView(frame: CGRect(x: (UIScreen.main.bounds.width - 128)/2.0, y: 148, width: 128, height: 128))
        self.view.addSubview(self.imgeView)
        
        self.imgeTranshFull = UIImage(named: "Blend Trash Full")
        
        self.imgeView.image = self.imgeTranshFull
        
        let recognizer = UIPinchGestureRecognizer(target: self, action: #selector(foundPinch(_:)))
        
        self.imgeView.addGestureRecognizer(recognizer)
        
        self.imgeView.isUserInteractionEnabled = true
    }

    @objc
    func foundPinch(_ sender:UIPinchGestureRecognizer){
        NSLog("缩放因子 = %f", sender.scale)
        if(sender.state == .ended){
            currentScale = Double(sender.scale)
        }else if sender.state == .began && currentScale != 0.0{
            sender.scale = CGFloat(currentScale)
        }
        self.imgeView.transform = CGAffineTransform(scaleX: sender.scale, y: sender.scale)
    }

}

