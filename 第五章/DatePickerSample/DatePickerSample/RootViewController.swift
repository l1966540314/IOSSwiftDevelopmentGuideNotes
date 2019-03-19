//
//  RootViewController.swift
//  DatePickerSample
//
//  Created by Hao on 2019/3/19.
//  Copyright © 2019年 LIUHAO. All rights reserved.
//

import UIKit

class RootViewController: UIViewController {

    var datePicker:UIDatePicker!
    var lable:UILabel!
    
    
    override func viewDidLoad() {
        super.viewDidLoad()

        self.view.backgroundColor = UIColor.white
        // Do any additional setup after loading the view.
        
        
        self.datePicker = UIDatePicker(frame: CGRect(x:0, y: 0, width: 320, height: 167))
        self.datePicker.locale = NSLocale(localeIdentifier: "zh-Hans") as Locale
        self.datePicker.datePickerMode = UIDatePicker.Mode.dateAndTime
        self.view.addSubview(self.datePicker)
        
        self.lable = UILabel(frame: CGRect(x: (UIScreen.main.bounds.size.width - 200)/2.0, y: 281, width: 200, height: 21))
        self.lable.text = "Lable"
        self.lable.textAlignment = NSTextAlignment.center
        self.view.addSubview(self.lable)
        
        let button = UIButton(type: UIButton.ButtonType.system)
        button.setTitle("Button", for: UIControl.State.normal)
        
        button.frame = CGRect(x: (UIScreen.main.bounds.size.width - 46)/2.0, y: 379, width: 46, height: 30)
        button.addTarget(self, action: #selector(onClick(_sender:)), for: UIControl.Event.touchUpInside)
        self.view.addSubview(button)
        
    }
    @objc
    func onClick(_sender:AnyObject){
        let theDate = self.datePicker.date
        NSLog("the date picked is: %@", theDate.description(with: NSLocale.current))
        let dateFormatter = DateFormatter()
        dateFormatter.dateFormat = "YYYY-MM-dd HH:mm:ss"
        NSLog("the date formate is:%@", dateFormatter.string(from: theDate))
        self.lable.text = dateFormatter.string(from: theDate)
    }

    /*
    // MARK: - Navigation

    // In a storyboard-based application, you will often want to do a little preparation before navigation
    override func prepare(for segue: UIStoryboardSegue, sender: Any?) {
        // Get the new view controller using segue.destination.
        // Pass the selected object to the new view controller.
    }
    */

}
