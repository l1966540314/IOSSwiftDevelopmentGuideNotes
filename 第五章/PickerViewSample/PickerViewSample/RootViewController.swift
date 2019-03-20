//
//  RootViewController.swift
//  PickerViewSample
//
//  Created by Hao on 2019/3/20.
//  Copyright © 2019年 LIUHAO. All rights reserved.
//

import UIKit

class RootViewController: UIViewController,UIPickerViewDelegate,UIPickerViewDataSource {

    var lable:UILabel!
    var pickerView:UIPickerView!
    var pickerData:NSDictionary!
    var pickerProvincesData:NSArray!
    var pickerCitiesData:NSArray!
    
    override func viewDidLoad() {
        super.viewDidLoad()

        self.view.backgroundColor = UIColor.white
        // Do any additional setup after loading the view.
        let plistPath = Bundle.main.path(forResource: "provinces_cities", ofType: "plist")
        let dict = NSDictionary(contentsOfFile: plistPath!)
        self.pickerData = dict
        
        self.pickerProvincesData = self.pickerData.allKeys as NSArray
        
        let selectedProvince = self.pickerProvincesData.object(at: 0)
        
        self.pickerCitiesData = self.pickerData.object(forKey: selectedProvince) as? NSArray
        
        self.pickerView = UIPickerView(frame: CGRect(x: 0, y: 0, width: 320, height: 162))
        self.pickerView.delegate = self
        self.pickerView.dataSource = self
        self.view.addSubview(self.pickerView)
        
        self.lable = UILabel(frame: CGRect(x: (UIScreen.main.bounds.size.width - 200)/2, y: 273, width: 200, height: 21))
        self.lable.textAlignment = NSTextAlignment.center
        self.lable.text = "Lable"
        self.view.addSubview(self.lable)
        
        let button = UIButton(type: UIButton.ButtonType.system)
        button.frame = CGRect(x: (UIScreen.main.bounds.size.width - 46)/2, y: 374, width: 46, height: 30)
        button.setTitle("Button", for: UIControl.State.normal)
        button.addTarget(self, action: #selector(onClick(_sener:)), for: UIControl.Event.touchUpInside)
        self.view.addSubview(button)
    }
    
    @objc
    func onClick(_sener:AnyObject){
        let row1 = self.pickerView.selectedRow(inComponent: 0)
        let row2 = self.pickerView.selectedRow(inComponent: 1)
        let selected1 = self.pickerProvincesData.object(at: row1) as! String
        let selected2 = self.pickerCitiesData.object(at: row2) as! String
        
        let title = NSString.init(format: "%@,%@市", selected1,selected2)
        self.lable.text = title as String
    }

    func numberOfComponents(in pickerView: UIPickerView) -> Int {
        return 2
    }
    
    func pickerView(_ pickerView: UIPickerView, numberOfRowsInComponent component: Int) -> Int {
        if(component == 0){
            return self.pickerProvincesData.count
        }else{
            return self.pickerCitiesData.count
        }
    }
    
    func pickerView(_ pickerView: UIPickerView, titleForRow row: Int, forComponent component: Int) -> String? {
        if(component == 0){
            return self.pickerProvincesData.object(at: row) as? String
        }else{
            return (self.pickerCitiesData.object(at: row) as! String)
        }
    }
    
    func pickerView(_ pickerView: UIPickerView, didSelectRow row: Int, inComponent component: Int) {
        if(component == 0){
            let selectedProvince = self.pickerProvincesData.object(at: row)
            let array = self.pickerData.object(forKey: selectedProvince)
            
            self.pickerCitiesData = array as? NSArray
            self.pickerView.reloadComponent(1)
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
