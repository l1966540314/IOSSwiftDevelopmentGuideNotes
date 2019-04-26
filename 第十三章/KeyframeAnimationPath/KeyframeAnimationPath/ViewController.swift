//
//  ViewController.swift
//  KeyframeAnimationPath
//
//  Created by Hao on 2019/4/26.
//  Copyright © 2019年 LIUHAO. All rights reserved.
//

import UIKit

class ViewController: UIViewController,CAAnimationDelegate {

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
        
        let starPath = CGMutablePath()
        starPath.move(to: CGPoint(x: 160, y: 100))
        starPath.addLine(to: CGPoint(x: 100, y: 280))
        starPath.addLine(to: CGPoint(x: 260, y: 170))
        starPath.addLine(to: CGPoint(x: 60, y: 170))
        starPath.addLine(to: CGPoint(x: 220, y: 280))
        starPath.closeSubpath()
        
        let animation = CAKeyframeAnimation(keyPath: "position")
        animation.duration = 10
        animation.delegate = self
        animation.path = starPath
        
        self.ball.layer.add(animation, forKey: "position")
    }
    
    func animationDidStart(_ anim: CAAnimation) {
        NSLog("动画开始....")
    }
    
    func animationDidStop(_ anim: CAAnimation, finished flag: Bool) {
        NSLog("动画结束...")
        UIView.animate(withDuration: 1.0) {
            self.button.alpha = 1.0
        }
    }
}

