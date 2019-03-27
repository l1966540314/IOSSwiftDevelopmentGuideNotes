//
//  EventCollectionViewCell.swift
//  CollectionViewSample
//
//  Created by Hao on 2019/3/20.
//  Copyright © 2019年 LIUHAO. All rights reserved.
//

import UIKit

class EventCollectionViewCell: UICollectionViewCell {
    var imgeView:UIImageView!
    var lable:UILabel!
    
    override init(frame: CGRect) {
        super.init(frame: frame)
        self.imgeView = UIImageView(frame: CGRect(x: (self.frame.size.width - 101)/2.0, y: 15, width: 101, height: 101))
        self.addSubview(self.imgeView)
        
        self.lable = UILabel(frame: CGRect(x: (self.frame.size.width - 101)/2.0, y: 120, width: 101, height: 16))
        self.lable.textAlignment = NSTextAlignment.center
        self.lable.font = UIFont.systemFont(ofSize: 13)
        self.addSubview(self.lable)
    }
    
    required init?(coder aDecoder: NSCoder) {
        fatalError("init(coder:) has not been implemented")
    }
}
