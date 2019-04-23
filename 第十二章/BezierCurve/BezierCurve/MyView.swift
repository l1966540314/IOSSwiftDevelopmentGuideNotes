//
//  MyView.swift
//  BezierCurve
//
//  Created by Hao on 2019/4/23.
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
        context?.move(to: CGPoint(x: 333, y: 0))
        
        context?.addCurve(to: CGPoint(x: 330, y: 26), control1: CGPoint(x: 333, y:0 ), control2: CGPoint(x: 332, y: 26))
        context?.addCurve(to: CGPoint(x: 299, y: 17), control1: CGPoint(x: 330, y: 26), control2: CGPoint(x: 299, y: 20))
        
        context?.addLine(to: CGPoint(x: 296, y: 17))
        
        context?.addCurve(to: CGPoint(x: 291, y: 19), control1: CGPoint(x: 296, y: 17), control2: CGPoint(x: 296, y: 19))
        
        context?.addLine(to: CGPoint(x: 250, y: 19))
        
        context?.addCurve(to: CGPoint(x: 238, y: 19), control1: CGPoint(x: 250, y: 19), control2: CGPoint(x: 241, y: 24))
        context?.addCurve(to: CGPoint(x: 227, y: 24), control1: CGPoint(x: 236, y: 20), control2: CGPoint(x: 234, y: 24))
        context?.addCurve(to: CGPoint(x: 216, y: 19), control1: CGPoint(x: 220, y: 24), control2: CGPoint(x: 217, y: 19))
        context?.addCurve(to: CGPoint(x: 207, y: 20), control1: CGPoint(x: 214, y: 20), control2: CGPoint(x: 211, y: 22))
        context?.addCurve(to: CGPoint(x: 182, y: 21), control1: CGPoint(x: 207, y: 20), control2: CGPoint(x: 187, y: 20))
        
        context?.addLine(to: CGPoint(x: 100, y: 45))
        context?.addLine(to: CGPoint(x: 97, y: 46))
        
        context?.addCurve(to: CGPoint(x: 64, y: 72), control1: CGPoint(x: 97, y: 46), control2: CGPoint(x: 86, y: 71))
        context?.addCurve(to: CGPoint(x: 23, y: 48), control1: CGPoint(x: 42, y: 74), control2: CGPoint(x: 26, y: 56))
        
        context?.addLine(to: CGPoint(x: 9, y: 47))
        
        context?.addCurve(to: CGPoint(x: 0, y: 0), control1: CGPoint(x: 9, y: 47), control2: CGPoint(x: 0, y: 31))
        
        context?.strokePath()
    }
}
