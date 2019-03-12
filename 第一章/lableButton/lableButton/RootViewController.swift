//
//  RootViewController.swift
//  lableButton
//
//  Created by Hao on 2019/3/4.
//  Copyright © 2019年 LIUHAO. All rights reserved.
//

import UIKit

class RootViewController: UIViewController {

    var lable:UILabel!
    
    override func viewDidLoad() {
        super.viewDidLoad()

        self.lable = UILabel(frame: CGRect(x: (UIScreen.main.bounds.width - 90)/2.0, y: 150, width: 90, height: 20))
        self.lable.text = "Lable"
        self.lable.textAlignment = NSTextAlignment.center
        self.view.addSubview(self.lable)
        
        let button:UIButton = UIButton(type: UIButton.ButtonType.system)
        button.addTarget(self, action: #selector(onClick(_:forEvent:)), for: UIControl.Event.touchUpInside)
        button.frame = CGRect(x: (UIScreen.main.bounds.width - 60)/2.0, y: 240, width: 60, height: 20)
        button.setTitle("OK", for: UIControl.State.normal)
        self.view.addSubview(button)
        
        // Do any additional setup after loading the view.
    }
    @objc func onClick(_ sender:Any, forEvent event:UIEvent){
        NSLog("OK Button onClick.")
        NSLog("%@", event)
        self.lable.text = "Hello"
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
