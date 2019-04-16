//
//  ViewController.swift
//  PopoverViewSample
//
//  Created by Hao on 2019/4/16.
//  Copyright © 2019年 LIUHAO. All rights reserved.
//

import UIKit

class ViewController: UIViewController,UIPopoverPresentationControllerDelegate {

    override func viewDidLoad() {
        super.viewDidLoad()
        // Do any additional setup after loading the view, typically from a nib.
    }
    
    @IBAction func show(_ sender: Any) {
        let popoverViewController = SelectViewController()
        
        popoverViewController.modalPresentationStyle = .popover
        
        self.present(popoverViewController, animated: true, completion: nil)
        
        
        let popController = popoverViewController.popoverPresentationController
        
        popController?.permittedArrowDirections = .any
        
        popController?.barButtonItem = sender as? UIBarButtonItem
        
        popController?.delegate = self
    }
    
    func prepareForPopoverPresentation(_ popoverPresentationController: UIPopoverPresentationController) {
        NSLog("呈现Popover视图")
    }

    func popoverPresentationControllerDidDismissPopover(_ popoverPresentationController: UIPopoverPresentationController) {
        NSLog("关闭Popover视图")
    }
}

