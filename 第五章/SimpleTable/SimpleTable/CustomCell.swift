//
//  CustomCell.swift
//  SimpleTable
//
//  Created by Hao on 2019/3/28.
//  Copyright © 2019年 LIUHAO. All rights reserved.
//

import UIKit

class CustomCell: UITableViewCell {

    var myLable:UILabel!
    var myImgeView:UIImageView!
    
    override func awakeFromNib() {
        super.awakeFromNib()
        // Initialization code
    }

    override func setSelected(_ selected: Bool, animated: Bool) {
        super.setSelected(selected, animated: animated)

        // Configure the view for the selected state
    }

    override init(style: UITableViewCell.CellStyle, reuseIdentifier: String?) {
        super.init(style: style, reuseIdentifier: reuseIdentifier)
        
        self.myImgeView = UIImageView(frame: CGRect(x: 300, y: (self.frame.size.height - 28)/2, width: 39, height: 28))
        self.addSubview(self.myImgeView)
        
        self.myLable = UILabel(frame: CGRect(x: 12, y: (self.frame.size.height - 21)/2, width: 120, height: 21))
        self.addSubview(self.myLable)
    }
    
    required init?(coder aDecoder: NSCoder) {
        fatalError("init(coder:) has not been implemented")
    }
}
