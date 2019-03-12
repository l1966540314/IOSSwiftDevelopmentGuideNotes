//
//  RootViewController.swift
//  helloWorld
//
//  Created by Hao on 2019/2/27.
//  Copyright © 2019年 LIUHAO. All rights reserved.
//

import UIKit

class RootViewController: UIViewController {

    override func viewDidLoad() {
        super.viewDidLoad()

        let lable:UILabel = UILabel.init(frame: CGRect(x: (UIScreen.main.bounds.size.width - 90)/2.0, y: 150, width: 90, height: 50))
        lable.text = "helloWorld"
        self.view.addSubview(lable)
        
        let button:UIButton = UIButton(type: UIButton.ButtonType.system)
        button.setTitle("OK", for: UIControl.State.normal)
        button.frame = CGRect(x: (UIScreen.main.bounds.width - 60)/2.0, y: 240, width: 60, height: 20)
        self.view.addSubview(button);
        
        
        
        
        
        
        
        
        
        // Do any additional setup after loading the view.
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
