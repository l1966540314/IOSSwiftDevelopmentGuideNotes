//
//  MyView.swift
//  ImgeStringSample
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
        
        let imge = UIImage(named: "dog")
        
        imge?.draw(in: CGRect(x: 0, y: 40, width: UIScreen.main.bounds.size.width, height: UIScreen.main.bounds.size.width))
        //imge?.draw(at: CGPoint(x: 0, y: 40))
        //imge?.drawAsPattern(in: CGRect(x: 0, y: 0, width: 320, height: 400))
        
        let title = "我的小狗"
        let font = UIFont.systemFont(ofSize: 28)
        let attr:NSDictionary = [NSAttributedString.Key.font:font]
        let size = title.size(withAttributes: attr as? [NSAttributedString.Key : Any])
        let xpos = (UIScreen.main.bounds.size.width - size.width)/2
        title.draw(at: CGPoint(x: xpos, y: 20),withAttributes:attr as? [NSAttributedString.Key : Any])
        //title.draw(in:CGRect(x: xpos, y: 60, width: 100, height: 40), withAttributes:attr as? [NSAttributedString.Key : Any])
        
    }
}
