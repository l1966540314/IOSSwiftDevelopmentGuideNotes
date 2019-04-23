//
//  MyView.swift
//  AffineSample
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
        
        let uiImage = UIImage(named: "cat")
        let cgImage = uiImage?.cgImage
        
        let context = UIGraphicsGetCurrentContext()
        
        var myAffine = CGAffineTransform(scaleX: 1, y: -1)
        
        myAffine = myAffine.translatedBy(x: 0, y: -uiImage!.size.height)
        
        context?.concatenate(myAffine)
        
        context?.draw(cgImage!, in: CGRect(x: 0, y: 0, width: uiImage!.size.width, height: uiImage!.size.height))
    }
}
