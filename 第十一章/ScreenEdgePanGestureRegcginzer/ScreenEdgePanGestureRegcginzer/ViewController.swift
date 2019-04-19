//
//  ViewController.swift
//  ScreenEdgePanGestureRegcginzer
//
//  Created by Hao on 2019/4/19.
//  Copyright © 2019年 LIUHAO. All rights reserved.
//

import UIKit

class ViewController: UIViewController {

    var lable:UILabel!
    
    
    override func viewDidLoad() {
        super.viewDidLoad()
        // Do any additional setup after loading the view, typically from a nib.
        self.lable = UILabel(frame: CGRect(x: (UIScreen.main.bounds.size.width - 300)/2.0, y: 150, width: 300, height: 30))
        self.lable.text = "屏幕边缘平移手势识别"
        
        self.lable.textAlignment = .center
        self.view.addSubview(self.lable)
        
        let edges:[UIRectEdge] = [UIRectEdge.right,UIRectEdge.left]
        
        for edge in edges {
            let recognizer = UIScreenEdgePanGestureRecognizer(target: self, action: #selector(foundScreenEdgePan(_:)))
            recognizer.edges = edge
            self.view.addGestureRecognizer(recognizer)
        }
        self.view.isUserInteractionEnabled = true
    }

    @objc
    func foundScreenEdgePan(_ sender:UIScreenEdgePanGestureRecognizer){
        NSLog("edge = %li", sender.edges.rawValue)
        switch sender.edges {
        case UIRectEdge.left:
            self.lable.text = "从左边缘向右平移"
        case UIRectEdge.right:
            self.lable.text = "从右边缘向左平移"
        default:
            self.lable.text = ""
        }
    }

}

