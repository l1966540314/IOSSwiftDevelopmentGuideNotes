//
//  RootViewController.swift
//  UploadDownload
//
//  Created by Hao on 2019/3/18.
//  Copyright © 2019年 LIUHAO. All rights reserved.
//

import UIKit

class RootViewController: UIViewController {

    var activityIndicatorView:UIActivityIndicatorView!
    var timer:Timer!
    var progressView:UIProgressView!
    
    override func viewDidLoad() {
        super.viewDidLoad()

        self.view.backgroundColor = UIColor.lightGray
        // Do any additional setup after loading the view.
        
        self.activityIndicatorView = UIActivityIndicatorView(style: UIActivityIndicatorView.Style.whiteLarge)
        var frame:CGRect = self.activityIndicatorView.frame
        frame.origin = CGPoint(x: (UIScreen.main.bounds.width - frame.size.width)/2.0, y: 84)
        self.activityIndicatorView.frame = frame
        self.activityIndicatorView.hidesWhenStopped = false
        self.view.addSubview(self.activityIndicatorView)
        
        let buttonUpload = UIButton(type: UIButton.ButtonType.system)
        buttonUpload.setTitle("Upload", for: UIControl.State.normal)
        buttonUpload.frame = CGRect(x: (UIScreen.main.bounds.width - 50)/2.0, y: 190, width: 50, height: 30)
        buttonUpload.addTarget(self, action: #selector(startToMove(_sender:)), for: UIControl.Event.touchUpInside)
        self.view.addSubview(buttonUpload)
        
        self.progressView = UIProgressView(frame: CGRect(x: (UIScreen.main.bounds.size.width - 200)/2, y: 283, width: 200, height: 2))
        self.view.addSubview(self.progressView)
        
        let buttonDownload = UIButton(type: UIButton.ButtonType.system)
        buttonDownload.setTitle("Download", for: UIControl.State.normal)
        
        buttonDownload.frame = CGRect(x: (UIScreen.main.bounds.size.width - 69)/2.0, y: 384, width: 69, height: 30)
        buttonDownload.addTarget(self, action: #selector(downLoadProgress(_sender:)), for: UIControl.Event.touchUpInside)
        self.view.addSubview(buttonDownload)
    }
    
    @objc
    func startToMove(_sender:AnyObject){
        if(self.activityIndicatorView.isAnimating){
            self.activityIndicatorView.stopAnimating()
        }else{
            self.activityIndicatorView.startAnimating()
        }
    }
    
    @objc
    func downLoadProgress(_sender:AnyObject){
        self.progressView.progress = 0
        if(self.timer != nil && self.timer.isValid){
            self.timer.invalidate()
            self.timer = nil
        }
        self.timer = Timer.scheduledTimer(timeInterval: 1.0, target: self, selector: #selector(download), userInfo: nil, repeats: true)
    }

    @objc
    func download(){
        self.progressView.progress = self.progressView.progress + 0.1
        if(self.progressView.progress == 1.0){
            if(self.timer.isValid){
                self.timer.invalidate()
                self.timer = nil
            }
            let alertController = UIAlertController(title: "download completed!", message: "", preferredStyle: UIAlertController.Style.alert)
            
            let okAction = UIAlertAction(title: "Ok", style: UIAlertAction.Style.cancel, handler: nil)
            
            alertController.addAction(okAction)
            
            self.present(alertController, animated: true, completion: nil)
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
