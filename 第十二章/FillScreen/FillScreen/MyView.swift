//
//  MyView.swift
//  FillScreen
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
        UIColor.gray.setFill()
        UIRectFill(rect)
        
        UIColor.white.setStroke()
        let frame = CGRect(x: 20, y: 30, width: 100, height: 300)
        UIRectFrame(frame)
    }
}
