//
//  MyView.swift
//  Quartz2UKit
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
        
        let imge = UIImage(named: "cat")
        let cgImage = imge?.cgImage
        
        let context = UIGraphicsGetCurrentContext()

        context?.scaleBy(x: 1, y: -1)
        context?.translateBy(x: 0, y: -imge!.size.height)
        context?.draw(cgImage!, in: CGRect(x: 0, y: 0, width: imge!.size.width, height: imge!.size.height))
    }
}
