//
//  RootViewController.swift
//  CollectionViewSample
//
//  Created by Hao on 2019/3/20.
//  Copyright © 2019年 LIUHAO. All rights reserved.
//

import UIKit

class RootViewController: UIViewController,UICollectionViewDelegate,UICollectionViewDataSource {
    
    let itemNum = 20
    let COL_NUM = 3
    var events:NSArray!
    var collectionView:UICollectionView!
    

    
    
    override func viewDidLoad() {
        super.viewDidLoad()

        self.view.backgroundColor = UIColor.white
        
        // Do any additional setup after loading the view.
        let talbleEvents = NSMutableArray()
        for i in 0..<itemNum {
            let dic:[String:AnyObject] = [
                "backGroundColor":UIColor(red: CGFloat(Float(arc4random()%255)/255.0), green: CGFloat(Float(arc4random()%255)/255.0), blue: CGFloat(Float(arc4random()%255)/255.0), alpha: 1.0),
                "text" : NSString(format: "第%d个", i + 1)
                                          ]
            talbleEvents.add(dic)
        }
        
        self.events = NSArray(array: talbleEvents)
        
        self.setupCollectionView()
    }
    
    func setupCollectionView(){
        let layount = UICollectionViewFlowLayout()
        layount.itemSize = CGSize(width: 80, height: 80)
        layount.sectionInset = UIEdgeInsets(top: 15, left: 15, bottom: 30, right: 15)
        if(UIScreen.main.bounds.size.height > 568){
            layount.itemSize = CGSize(width: 100, height: 100)
            layount.sectionInset = UIEdgeInsets(top: 15, left: 15, bottom: 20, right: 15)
        }
        layount.minimumInteritemSpacing = 10
        self.collectionView = UICollectionView(frame: self.view.frame, collectionViewLayout: layount)
        self.collectionView.register(EventCollectionViewCell.self, forCellWithReuseIdentifier: "cellIdentifier")
        self.collectionView.backgroundColor = UIColor.white
        
        self.collectionView.delegate = self
        self.collectionView.dataSource = self
        
        self.view.addSubview(self.collectionView)
    }
    
    func numberOfSections(in collectionView: UICollectionView) -> Int {
        let num = self.events.count % COL_NUM
        if(num == 0){
            return self.events.count / COL_NUM
        }else{
            return self.events.count / COL_NUM + 1
        }
    }
    
    func collectionView(_ collectionView: UICollectionView, numberOfItemsInSection section: Int) -> Int {
        return COL_NUM
    }
    
    func collectionView(_ collectionView: UICollectionView, cellForItemAt indexPath: IndexPath) -> UICollectionViewCell {
        let cell:EventCollectionViewCell = collectionView.dequeueReusableCell(withReuseIdentifier: "cellIdentifier", for: indexPath) as! EventCollectionViewCell
        let idx = indexPath.section * COL_NUM + indexPath.row
        if(self.events.count <= idx){
            return cell
        }
        
        let event:[String:AnyObject] = self.events.object(at: idx) as! [String : AnyObject]
        cell.lable.text = event["text"] as? String
//        cell.imgeView.image = event[""]
        cell.imgeView.backgroundColor = event["backGroundColor"] as? UIColor
        return cell
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
