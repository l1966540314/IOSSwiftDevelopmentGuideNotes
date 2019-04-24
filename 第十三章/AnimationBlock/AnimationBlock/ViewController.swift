//
//  ViewController.swift
//  AnimationBlock
//
//  Created by Hao on 2019/4/24.
//  Copyright © 2019年 LIUHAO. All rights reserved.
//

import UIKit

class ViewController: UIViewController {

    var flag = 1
    var ball:UIImageView!
    var button:UIButton!
    
    override func viewDidLoad() {
        super.viewDidLoad()
        // Do any additional setup after loading the view, typically from a nib.
        self.ball = UIImageView(frame: CGRect(x: (UIScreen.main.bounds.size.width - 86)/2, y: 150, width: 86, height: 86))
        self.ball.image = UIImage(named: "Ball")
        self.view.addSubview(self.ball)
        
        self.button = UIButton(type: UIButton.ButtonType.custom)
        
        self.button.setImage(UIImage(named: "ButtonOutline"), for: UIControl.State.normal)
        
        self.button.setImage(UIImage(named: "ButtonOutlineHighlighted"), for: UIControl.State.highlighted)
        self.button.addTarget(self, action: #selector(onClick(_:)), for: UIControl.Event.touchUpInside)
        
        self.button.frame = CGRect(x: (UIScreen.main.bounds.size.width - 130)/2.0, y: 500, width: 130, height: 50)
        self.view.addSubview(self.button)
    }


    @objc
    func onClick(_ sender : AnyObject){
        
        self.button.alpha = 0
        
        UIView.animate(withDuration: 1.5, animations: {
            var frame = self.ball.frame
            frame.origin.y = frame.origin.y + CGFloat(200 * self.flag)
            self.flag = self.flag * (-1)
            self.ball.frame = frame
        }) { (finished) in
            self.viewAnimationDone()
        }
        
        
    }
    
    func viewAnimationDone(){
        UIView.animate(withDuration: 1) {
           self.button.alpha = 1
        }
    }
}

