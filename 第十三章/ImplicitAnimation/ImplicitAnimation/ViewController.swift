//
//  ViewController.swift
//  ImplicitAnimation
//
//  Created by Hao on 2019/4/25.
//  Copyright © 2019年 LIUHAO. All rights reserved.
//

import UIKit

class ViewController: UIViewController {

    var plane:UIImageView!
    
    override func viewDidLoad() {
        super.viewDidLoad()
        // Do any additional setup after loading the view, typically from a nib.
        
        self.plane = UIImageView(frame: CGRect(x: 20, y: 25, width: 100, height: 100))
        
        self.plane.image = UIImage(named: "clipartPlane")
        
        self.plane.layer.opacity = 0.25
        
        self.view.addSubview(self.plane)
        
        let button = UIButton(type: UIButton.ButtonType.custom)
        
        button.setImage(UIImage(named: "ButtonOutline"), for: UIControl.State.normal)
        button.setImage(UIImage(named: "ButtonOutlineHighlighted"), for: UIControl.State.highlighted)
        
        button.addTarget(self, action: #selector(movePlane(_:)), for: UIControl.Event.touchUpInside)
        
        button.frame = CGRect(x: (UIScreen.main.bounds.size.width - 130)/2.0, y: 500, width: 130, height: 50)
        
        self.view.addSubview(button)
    }


    @objc
    func movePlane(_ sender:AnyObject){
//        let moveTransform = CGAffineTransform(translationX: 200, y: 300)
//        self.plane.layer.setAffineTransform(moveTransform)
//        self.plane.layer.opacity = 1
        
//        let opAnim = CABasicAnimation(keyPath: "opacity")
//        opAnim.duration = 3.0
//        opAnim.fromValue = 0.25
//        opAnim.toValue = 1
//        opAnim.isCumulative = true
//        opAnim.repeatCount = 2
//        opAnim.fillMode = .forwards
//        opAnim.isRemovedOnCompletion = false
//        self.plane.layer.add(opAnim, forKey: "animateOpacity")

        let moveTransform = CGAffineTransform(translationX: 200, y: 300)
        let moveAnimal = CABasicAnimation(keyPath: "transform")
        moveAnimal.duration = 6.0
        moveAnimal.toValue = NSValue(caTransform3D: CATransform3DMakeAffineTransform(moveTransform))
        moveAnimal.fillMode = .forwards
        moveAnimal.isRemovedOnCompletion = false
        self.plane.layer.add(moveAnimal, forKey: "animateTransform")
        
        let opAnimal = CAKeyframeAnimation(keyPath: "opacity")
        opAnimal.duration = 6
        opAnimal.keyTimes = [0.0,0.5,1.0]
        opAnimal.values = [0.25,0.75,1.0]
        opAnimal.fillMode = .forwards
        opAnimal.isRemovedOnCompletion = false
        self.plane.layer.add(opAnimal, forKey: "animateOpacity")
        
    }
}

