//
//  ViewController.swift
//  PageNavigation
//
//  Created by Hao on 2019/4/9.
//  Copyright © 2019年 LIUHAO. All rights reserved.
//

import UIKit

class ViewController: UIViewController,UIPageViewControllerDelegate,UIPageViewControllerDataSource {
    func pageViewController(_ pageViewController: UIPageViewController, viewControllerBefore viewController: UIViewController) -> UIViewController? {
        pageIndex = pageIndex - 1
        if(pageIndex < 0){
            pageIndex = 0
            return nil
        }
        directionForward = DirectionForward.ForwardBefore
        return self.viewControllers[pageIndex] as? UIViewController
    }
    
    func pageViewController(_ pageViewController: UIPageViewController, viewControllerAfter viewController: UIViewController) -> UIViewController? {
        pageIndex += 1
        if(pageIndex > 2){
            pageIndex = 2
            return nil
        }
        
        directionForward = DirectionForward.ForwardAfter
        return self.viewControllers[pageIndex] as? UIViewController
    }
    

    enum DirectionForward:Int {
        case ForwardBefore = 1
        case ForwardAfter = 2
    }
    
    var pageIndex = 0
    var directionForward = DirectionForward.ForwardAfter
    
    var pageViewController:UIPageViewController!
    var viewControllers:NSArray!
    
    override func viewDidLoad() {
        super.viewDidLoad()
        // Do any additional setup after loading the view, typically from a nib.
        pageIndex = 0
        directionForward = DirectionForward.ForwardAfter
        
        let page1ViewController = UIViewController()
        let page2ViewController = UIViewController()
        let page3ViewController = UIViewController()
        
        self.viewControllers = [page1ViewController,page2ViewController,page3ViewController]
        
        let imgeView1 = UIImageView(frame: self.view.frame)
        imgeView1.image = UIImage(named: "达芬奇-蒙娜丽莎.png")
        page1ViewController.view.addSubview(imgeView1)
        
        let imgeView2 = UIImageView(frame: self.view.frame)
        imgeView2.image = UIImage(named: "罗丹-思想者.png")
        page2ViewController.view.addSubview(imgeView2)
        
        let imgeView3 = UIImageView(frame: self.view.frame)
        imgeView3.image = UIImage(named: "保罗克利-肖像.png")
        page3ViewController.view.addSubview(imgeView3)
        
        self.pageViewController = UIPageViewController(transitionStyle: UIPageViewController.TransitionStyle.pageCurl, navigationOrientation: UIPageViewController.NavigationOrientation.horizontal, options: nil)
//        self.pageViewController = UIPageViewController(transitionStyle: UIPageViewController.TransitionStyle.scroll, navigationOrientation: UIPageViewController.NavigationOrientation.horizontal, options: nil)
        
        self.pageViewController.delegate = self
        
        self.pageViewController.dataSource = self
        
        self.pageViewController.setViewControllers([page1ViewController], direction: UIPageViewController.NavigationDirection.forward, animated: true, completion: nil)
        
        self.view.addSubview(self.pageViewController.view)
    }


    func pageViewController(_ pageViewController: UIPageViewController, spineLocationFor orientation: UIInterfaceOrientation) -> UIPageViewController.SpineLocation {
        self.pageViewController.isDoubleSided = false
        return UIPageViewController.SpineLocation.min
    }
    
    func pageViewController(_ pageViewController: UIPageViewController, didFinishAnimating finished: Bool, previousViewControllers: [UIViewController], transitionCompleted completed: Bool) {
        if(completed == false){
            if(directionForward == DirectionForward.ForwardAfter){
                pageIndex -= 1
            }
            if(directionForward == DirectionForward.ForwardBefore){
                pageIndex += 1
            }
        }
    }
}

