//
//  ViewController.swift
//  RotationGestureRecognizer
//
//  Created by Hao on 2019/4/19.
//  Copyright © 2019年 LIUHAO. All rights reserved.
//

import UIKit

class ViewController: UIViewController {

    var rotationAngleinRadians = 0.0
    
    var imgeTranshFull:UIImage!
    var imgeView:UIImageView!
    
    override func viewDidLoad() {
        super.viewDidLoad()
        // Do any additional setup after loading the view, typically from a nib.
        self.imgeView = UIImageView(frame: CGRect(x: (UIScreen.main.bounds.width - 128)/2.0, y: 148, width: 128, height: 128))
        self.imgeView.backgroundColor = UIColor.yellow
        self.view.addSubview(self.imgeView)
        
        self.imgeTranshFull = UIImage(named: "Blend Trash Full")
        
        self.imgeView.image = self.imgeTranshFull
        
        let recognizer = UIRotationGestureRecognizer(target: self, action: #selector(foundRotation(_:)))
        self.imgeView.addGestureRecognizer(recognizer)
        
        self.imgeView.isUserInteractionEnabled = true
    }

    @objc
    func foundRotation(_ sender:UIRotationGestureRecognizer){
        self.imgeView.transform = CGAffineTransform(rotationAngle: CGFloat(self.rotationAngleinRadians) + sender.rotation)
        
        if(sender.state == .ended){
            self.rotationAngleinRadians = Double(sender.rotation) + rotationAngleinRadians
        }
    }

}

