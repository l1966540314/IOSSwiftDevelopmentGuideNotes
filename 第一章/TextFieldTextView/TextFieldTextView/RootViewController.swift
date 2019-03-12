//
//  RootViewController.swift
//  TextFieldTextView
//
//  Created by Hao on 2019/3/4.
//  Copyright © 2019年 LIUHAO. All rights reserved.
//

import UIKit

class RootViewController: UIViewController,UITextViewDelegate,UITextFieldDelegate {

    override func viewDidLoad() {
        super.viewDidLoad()

        self.view.backgroundColor = UIColor.white
        
        let textField:UITextField = UITextField(frame: CGRect(x: (UIScreen.main.bounds.width - 223)/2.0, y: 150, width: 223, height: 30))
        
        textField.borderStyle = UITextField.BorderStyle.roundedRect
        
        textField.returnKeyType = UIReturnKeyType.next
        
        textField.keyboardType = UIKeyboardType.numbersAndPunctuation
        
        textField.delegate = self
        
        self.view.addSubview(textField)
        
        let nameLable:UILabel = UILabel(frame: CGRect(x: textField.frame.origin.x, y: textField.frame.origin.y - 30, width: 51, height: 21))
        
        nameLable.text = "Name:"
        
        self.view.addSubview(nameLable)
        
        let textView:UITextView = UITextView(frame: CGRect(x: (UIScreen.main.bounds.width - 236)/2.0, y: 240, width: 236, height: 198))
        
        textView.text = "Lorem ipsum dolor sit er elit lamet,..."
        
        textView.delegate = self
        
        textView.returnKeyType = UIReturnKeyType.go
        
        textView.keyboardType = UIKeyboardType.default
        
        self.view.addSubview(textView)
        
        let lableAbstract = UILabel(frame: CGRect(x: textView.frame.origin.x, y: textView.frame.origin.y - 30, width: 103, height: 21))
        
        lableAbstract.text = "Abstract:"
        
        self.view.addSubview(lableAbstract)
        
        // Do any additional setup after loading the view.
    }
    
    override func viewWillAppear(_ animated: Bool) {
        super.viewWillAppear(animated)
        NotificationCenter.default.addObserver(self, selector: #selector(keyBoardDidShow(_:)), name:UIResponder.keyboardDidShowNotification , object: nil)
        NotificationCenter.default.addObserver(self, selector: #selector(keyBoardDidHide(_:)), name: UIResponder.keyboardDidHideNotification, object: nil)
    }
    
    override func viewWillDisappear(_ animated: Bool) {
        super.viewWillDisappear(animated)
        NotificationCenter.default.removeObserver(self, name: UIResponder.keyboardDidShowNotification, object: nil)
        NotificationCenter.default.removeObserver(self, name: UIResponder.keyboardDidHideNotification, object: nil)
    }

    @objc func keyBoardDidShow(_ notication:Notification){
        NSLog("键盘打开")
    }
    @objc func keyBoardDidHide(_ notication:Notification){
        NSLog("键盘关闭")
    }
    
    func textFieldShouldReturn(_ textField: UITextField) -> Bool {
        NSLog("TextField获得焦点,点击return键")
        textField.resignFirstResponder()
        return true
    }
    
    func textView(_ textView: UITextView, shouldChangeTextIn range: NSRange, replacementText text: String) -> Bool {
        if(text == "\n"){
            NSLog("TextView获得焦点，点击return键")
            textView.resignFirstResponder()
            return false
        }
        return true
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
