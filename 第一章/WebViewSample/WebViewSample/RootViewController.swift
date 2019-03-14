//
//  RootViewController.swift
//  WebViewSample
//
//  Created by Hao on 2019/3/13.
//  Copyright © 2019年 LIUHAO. All rights reserved.
//

import UIKit
import WebKit
class RootViewController: UIViewController,WKNavigationDelegate {

    var webView:WKWebView!
    
    override func viewDidLoad() {
        super.viewDidLoad()
        self.view.backgroundColor = UIColor.white
        // Do any additional setup after loading the view.
        let buttonBar:UIView = UIView(frame: CGRect(x: (UIScreen.main.bounds.size.width - 316)/2.0, y: 20, width: 316, height: 30))
        self.view.addSubview(buttonBar)
        
        let buttonLoadHTMLString:UIButton = UIButton(type: UIButton.ButtonType.system)
        buttonLoadHTMLString.setTitle("LoadHTMLString", for: UIControl.State.normal)
        buttonLoadHTMLString.frame = CGRect(x: 0, y: 0, width: 117, height: 30)
        buttonLoadHTMLString.addTarget(self, action: #selector(testLoadHTMLString(_sender:)), for: UIControl.Event.touchUpInside)
        buttonBar.addSubview(buttonLoadHTMLString)
        
        let buttonLoadData:UIButton = UIButton(type: UIButton.ButtonType.system)
        buttonLoadData.setTitle("LoadData", for: UIControl.State.normal)
        buttonLoadData.frame = CGRect(x: 137, y: 0, width: 67, height: 30)
        buttonLoadData.addTarget(self, action: #selector(testLoadData(_sender:)), for: UIControl.Event.touchUpInside)
        buttonBar.addSubview(buttonLoadData)
        
        let buttonLoadRequest = UIButton(type: UIButton.ButtonType.system)
        buttonLoadRequest.setTitle("LoadRequest", for: UIControl.State.normal)
        buttonLoadRequest.frame = CGRect(x: 224, y: 0, width: 92, height: 30)
        buttonLoadRequest.addTarget(self, action: #selector(testLoadRequest(_sender:)), for: UIControl.Event.touchUpInside)
        buttonBar.addSubview(buttonLoadRequest)
        
        self.webView = WKWebView(frame: CGRect(x: 0, y: 60, width: UIScreen.main.bounds.size.width, height: UIScreen.main.bounds.size.height - 60))
        self.view.addSubview(self.webView)
    }
    
    @objc
    func testLoadHTMLString(_sender:AnyObject){
        let htmlPath = Bundle.main.path(forResource: "hao123", ofType: "htm")
        
        let bundleUrl = NSURL.fileURL(withPath: Bundle.main.bundlePath)
        
        do {
            let html = try String(contentsOfFile: htmlPath!, encoding: String.Encoding(rawValue: String.Encoding.utf8.rawValue))
            self.webView.loadHTMLString(html, baseURL: bundleUrl)
        } catch let err as Error{
            err.localizedDescription
        }
    }
    
    @objc
    func testLoadData(_sender:AnyObject){
        let htmlPath = Bundle.main.path(forResource: "hao123", ofType: "htm")
        
        let bundleUrl = NSURL.fileURL(withPath: Bundle.main.bundlePath)
        
        let htmlData = NSData.init(contentsOfFile: htmlPath!)
        
        self.webView.load(htmlData! as Data, mimeType: "text/html", characterEncodingName: "UTF-8", baseURL: bundleUrl)
        
    }

    @objc
    func testLoadRequest(_sender:AnyObject){
        let url = NSURL(string: "https://www.hao123.com")
        let request = NSURLRequest(url: url! as URL)
        self.webView.load(request as URLRequest)
        self.webView.navigationDelegate = self
        /*
        <?xml version="1.0" encoding="UTF-8"?>
        <!DOCTYPE plist PUBLIC "-//Apple//DTD PLIST 1.0//EN" "http://www.apple.com/DTDs/PropertyList-1.0.dtd">
        <plist version="1.0">
        <dict>
        <key>NSAllowsArbitraryLoads</key>
        <true/>
        </dict>
        </plist>
         */
    }
    
    func webView(_ webView: WKWebView, didStartProvisionalNavigation navigation: WKNavigation!) {
        NSLog("开始加载")
    }
    
    func webView(_ webView: WKWebView, didCommit navigation: WKNavigation!) {
        NSLog("内容开始返回")
    }
    
    func webView(_ webView: WKWebView, didFinish navigation: WKNavigation!) {
        NSLog("加载完成")
    }
    
    func webView(_ webView: WKWebView, didFail navigation: WKNavigation!, withError error: Error) {
        NSLog("加载失败err:%@",error.localizedDescription)
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
