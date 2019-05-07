//
//  Note.swift
//  MyNotes
//
//  Created by Hao on 2019/5/5.
//  Copyright © 2019年 LIUHAO. All rights reserved.
//

import UIKit

class Note: NSObject {

    var date:NSDate
    var content:NSString
    
    override init() {
        self.date = NSDate()
        self.content = ""
    }
    
    init(date: NSDate, content:NSString) {
        self.date = date
        self.content = content
    }
}
