//
//  RegisterViewController.swift
//  ModalViewSample
//
//  Created by Hao on 2019/4/8.
//  Copyright © 2019年 LIUHAO. All rights reserved.
//

import UIKit

class RegisterViewController: UIViewController {

    @IBOutlet weak var txtUsername: UITextField!
    override func viewDidLoad() {
        super.viewDidLoad()

        // Do any additional setup after loading the view.
    }
    
    @IBAction func save(_ sender: Any) {
        self.dismiss(animated: true) {
            print("点击save按钮，关闭模态视图")
            
            let dataDict = ["userName" : self.txtUsername.text]
            
            NotificationCenter.default.post(name: NSNotification.Name(rawValue: "RegisterCompletionNotification"), object: nil, userInfo: dataDict as [String : Any])
        }
    }
    
    @IBAction func cancel(_ sender: Any) {
        self.dismiss(animated: true) {
           print("点击Cancel按钮，关闭模态视图")
        }
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
