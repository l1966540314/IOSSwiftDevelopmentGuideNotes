//
//  CustomCell.swift
//  SimpleTable
//
//  Created by Hao on 2019/3/31.
//  Copyright © 2019年 LIUHAO. All rights reserved.
//

import UIKit

class CustomCell: UITableViewCell {
    @IBOutlet weak var myLable: UILabel!
    @IBOutlet weak var myImageView: UIImageView!
    
    override func awakeFromNib() {
        super.awakeFromNib()
        // Initialization code
    }

    override func setSelected(_ selected: Bool, animated: Bool) {
        super.setSelected(selected, animated: animated)

        // Configure the view for the selected state
    }

}
