//
//  DetailViewController.swift
//  TreeNavigation
//
//  Created by Hao on 2019/4/10.
//  Copyright © 2019年 LIUHAO. All rights reserved.
//

import UIKit
import WebKit

class DetailViewController: UIViewController,WKNavigationDelegate {

    var url : String!
    var webView:WKWebView!
    
    override func viewDidLoad() {
        super.viewDidLoad()

        // Do any additional setup after loading the view.
        self.webView = WKWebView(frame: self.view.frame)
        self.view.addSubview(self.webView)
        self.webView.navigationDelegate = self
        
        let url = NSURL(string: self.url)
        let request = URLRequest(url: url! as URL)
        self.webView.load(request)
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
