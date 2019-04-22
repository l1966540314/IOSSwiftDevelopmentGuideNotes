//
//  MyView.swift
//  StrokedFilledTriangle
//
//  Created by Hao on 2019/4/22.
//  Copyright © 2019年 LIUHAO. All rights reserved.
//

import UIKit

class MyView: UIView {

    /*
    // Only override draw() if you perform custom drawing.
    // An empty implementation adversely affects performance during animation.
    override func draw(_ rect: CGRect) {
        // Drawing code
    }
    */

    override func draw(_ rect: CGRect) {
        UIColor.white.setFill()
        UIRectFill(rect)
        
        let context = UIGraphicsGetCurrentContext()
        context?.move(to: CGPoint(x: 75, y: 10))
        context?.addLine(to: CGPoint(x: 10, y: 150))
        context?.addLine(to: CGPoint(x: 160, y: 150))
        context?.closePath()
        
        UIColor.black.setStroke()
        UIColor.red.setFill()
        context?.drawPath(using: CGPathDrawingMode.fillStroke)
    }
}
