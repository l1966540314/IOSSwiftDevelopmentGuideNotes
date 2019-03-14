//
//  RootViewController.swift
//  AlertViewActionSheet
//
//  Created by Hao on 2019/3/14.
//  Copyright © 2019年 LIUHAO. All rights reserved.
//

import UIKit

class RootViewController: UIViewController {

    override func viewDidLoad() {
        super.viewDidLoad()

        self.view.backgroundColor = UIColor.white
        // Do any additional setup after loading the view.
        let buttonAlertView = UIButton(type: UIButton.ButtonType.system)
        buttonAlertView.setTitle("Test警告框", for: UIControl.State.normal)
        
        buttonAlertView.frame = CGRect(x: (UIScreen.main.bounds.size.width - 100)/2, y: 130, width: 100, height: 30)
        
//        buttonAlertView.addTarget(self, action: #selector(testAlertView(_sender:)), for: UIControl.Event.touchUpInside)
        buttonAlertView.addTarget(self, action: #selector(testActionSheet(_sender:)), for: UIControl.Event.touchUpInside)
        
        self.view.addSubview(buttonAlertView)
    }
    
    @objc
    func testAlertView(_sender:AnyObject) {
        let alertController = UIAlertController(title: "Alert", message: "Alert text goes here", preferredStyle: UIAlertController.Style.alert)
        
        let noAction = UIAlertAction(title: "No", style: UIAlertAction.Style.cancel) { (alertAction)->Void in
            print("Tap No Button")
        }
        
        let yesAction = UIAlertAction(title: "Yes", style: UIAlertAction.Style.default) { (UIAlertAction)->Void in
            print("Tap Yes Button")
        }
        
        alertController.addAction(noAction)
        alertController.addAction(yesAction)
        
        self.present(alertController, animated: true, completion: nil)
    }
    
    @objc
    func testActionSheet(_sender:AnyObject){
        let actionSheetController = UIAlertController()
        
        let cancelAction = UIAlertAction(title: "取消", style: UIAlertAction.Style.cancel) { (action)->Void in
            print("Tap 取消 Button")
        }
        
        let destructiveAction = UIAlertAction(title: "破坏性按钮", style: UIAlertAction.Style.destructive) { (UIAlertAction)->Void in
            print("Tap 破坏性按钮 Button")
        }
        
        let otherAction = UIAlertAction(title: "新浪微博", style: UIAlertAction.Style.default) { (UIAlertAction)->Void in
            print("Tap 新浪微博 Button")
        }
        
        actionSheetController.addAction(cancelAction)
        actionSheetController.addAction(destructiveAction)
        actionSheetController.addAction(otherAction)
        
        actionSheetController.popoverPresentationController?.sourceView = _sender as? UIView
        
        self.present(actionSheetController, animated: true, completion: nil)
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
