//
//  ViewController.swift
//  SwipeGestureRecognizer
//
//  Created by Hao on 2019/4/18.
//  Copyright © 2019年 LIUHAO. All rights reserved.
//

import UIKit

class ViewController: UIViewController {

    var lable:UILabel!
    
    override func viewDidLoad() {
        super.viewDidLoad()
        // Do any additional setup after loading the view, typically from a nib.
        self.lable = UILabel(frame: CGRect(x: (UIScreen.main.bounds.size.width - 300)/2.0, y: 150, width: 300, height: 30))
        self.lable.text = "Swipe(滑动),手势识别"
        
        self.lable.textAlignment = .center
        self.view.addSubview(self.lable)
        
        let directions:[UISwipeGestureRecognizer.Direction] = [UISwipeGestureRecognizer.Direction.right,UISwipeGestureRecognizer.Direction.left,UISwipeGestureRecognizer.Direction.up,UISwipeGestureRecognizer.Direction.down]
        
        for direction in directions {
            let recognizer = UISwipeGestureRecognizer(target: self, action: #selector(foundSwipe(_:)))
            recognizer.direction = direction
            self.view.addGestureRecognizer(recognizer)
        }
        self.view.isUserInteractionEnabled = true
    }

    @objc
    func foundSwipe(_ sender:UISwipeGestureRecognizer){
        NSLog("direction = %li", sender.direction.rawValue)
        
        switch sender.direction {
        case UISwipeGestureRecognizer.Direction.right:
            self.lable.text = "向右移"
        case UISwipeGestureRecognizer.Direction.left:
            self.lable.text = "向左移"
        case UISwipeGestureRecognizer.Direction.up:
            self.lable.text = "向上移"
        case UISwipeGestureRecognizer.Direction.down:
            self.lable.text = "向下移"
        default:
            self.lable.text = "未知"
        }
    }

}

