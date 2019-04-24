//
//  ViewController.swift
//  AnimationTransition
//
//  Created by Hao on 2019/4/24.
//  Copyright © 2019年 LIUHAO. All rights reserved.
//

import UIKit

class ViewController: UIViewController {

    override func viewDidLoad() {
        super.viewDidLoad()
        // Do any additional setup after loading the view, typically from a nib.
    }

    @IBAction func doUIViewAnimation(_ sender: Any) {
        let button = sender as! UIButton
        NSLog("tag = %li", button.tag)
        
        switch button.tag {
        case 4:
            UIView.transition(with: self.view, duration: 1.5, options: [.curveEaseOut,.transitionFlipFromLeft], animations: {
                NSLog("开始动画")
            }) { (finish) in
                NSLog("动画完成")
            }
        case 3:
            UIView.transition(with: self.view, duration: 1.5, options: [.curveEaseOut,.transitionFlipFromRight], animations: {
                NSLog("开始动画")
            }) { (finish) in
                NSLog("动画完成")
            }
        case 2:
            UIView.transition(with: self.view, duration: 1.5, options: [.curveEaseOut,.transitionCurlUp], animations: {
                NSLog("开始动画")
            }) { (finish) in
                NSLog("动画完成")
            }
        case 1:
            UIView.transition(with: self.view, duration: 1.5, options: [.curveEaseOut,.transitionCurlDown], animations: {
                NSLog("开始动画")
            }) { (finish) in
                NSLog("动画完成")
            }
        default:
            UIView.transition(with: self.view, duration: 1.5, options: [.curveEaseOut,.transitionCurlDown], animations: {
                NSLog("开始动画")
            }) { (finish) in
                NSLog("动画完成")
            }
        }
    }
    
}

