//
//  ViewController.swift
//  PageControlNavigation
//
//  Created by Hao on 2019/4/8.
//  Copyright © 2019年 LIUHAO. All rights reserved.
//

import UIKit

class ViewController: UIViewController,UIScrollViewDelegate {

    let S_WIDTH = UIScreen.main.bounds.size.width
    let S_HEIGHT = UIScreen.main.bounds.size.height
    
    @IBOutlet weak var scrollView: UIScrollView!
    
    @IBOutlet weak var pageControl: UIPageControl!
    
    var imageView1:UIImageView!
    
    var imageView2:UIImageView!
    
    var imageView3:UIImageView!
    
    override func viewDidLoad() {
        super.viewDidLoad()
        // Do any additional setup after loading the view, typically from a nib.
        self.scrollView.delegate = self
        self.scrollView.contentSize = CGSize(width: S_WIDTH * 3, height: S_HEIGHT)
        self.scrollView.frame = self.view.bounds
        
        self.imageView1 = UIImageView(frame: CGRect(x: 0, y: 0, width: S_WIDTH, height: S_HEIGHT))
        self.imageView1.image = UIImage(named: "达芬奇-蒙娜丽莎")
        
        self.imageView2 = UIImageView(frame: CGRect(x: S_WIDTH, y: 0, width: S_WIDTH, height: S_HEIGHT))
        self.imageView2.image = UIImage(named: "罗丹-思想者")
        
        self.imageView3 = UIImageView(frame: CGRect(x: S_WIDTH * 2, y: 0, width: S_WIDTH, height: S_HEIGHT))
        self.imageView3.image = UIImage(named: "保罗克利-肖像")
        
        self.scrollView.addSubview(self.imageView1)
        self.scrollView.addSubview(self.imageView2)
        self.scrollView.addSubview(self.imageView3)
    }


    func scrollViewDidScroll(_ scrollView: UIScrollView) {
        let offset = scrollView.contentOffset
        self.pageControl.currentPage = Int(offset.x / S_WIDTH)
        
        
    }
    @IBAction func changePage(_ sender: Any) {
        UIView.animate(withDuration: 0.3) {
            let whichPage = self.pageControl.currentPage
            self.scrollView.contentOffset = CGPoint(x: self.S_WIDTH * CGFloat(whichPage), y: 0)
        }
    }
}

