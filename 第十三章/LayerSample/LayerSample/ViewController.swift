//
//  ViewController.swift
//  LayerSample
//
//  Created by Hao on 2019/4/25.
//  Copyright © 2019年 LIUHAO. All rights reserved.
//

import UIKit

class ViewController: UIViewController {

    var ballLayer:CALayer!
    
    override func viewDidLoad() {
        super.viewDidLoad()
        // Do any additional setup after loading the view, typically from a nib.
        self.ballLayer = CALayer()
        
        let image = UIImage(named: "Ball2.png")
        
        self.ballLayer.contents = image?.cgImage
        
        self.ballLayer.contentsGravity = .resizeAspect
        
        self.ballLayer.bounds = CGRect(x: 0, y: 0, width: 125, height: 125)
        
        self.ballLayer.position = CGPoint(x: self.view.bounds.midX, y: self.view.bounds.midY)
        
        self.view.layer.addSublayer(self.ballLayer)
    }


}

