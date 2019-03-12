//
//  RootViewController.swift
//  SwitchSliderSegmentedControl
//
//  Created by Hao on 2019/3/11.
//  Copyright © 2019年 LIUHAO. All rights reserved.
//

import UIKit

class RootViewController: UIViewController {

    var leftSwich:UISwitch!
    var rightSwich:UISwitch!
    var sliderValue:UILabel!
    
    
    
    override func viewDidLoad() {
        super.viewDidLoad()

        self.view.backgroundColor = UIColor.white
        // Do any additional setup after loading the view.
        
        let screen:CGRect = UIScreen.main.bounds
        let switchScreenSpace:CGFloat = 39
        
        self.rightSwich = UISwitch()
        var frame:CGRect = self.rightSwich.frame
        frame.origin = CGPoint(x: switchScreenSpace, y: 98)
        self.rightSwich.frame = frame
        
        self.rightSwich.isOn = true
        self.rightSwich.addTarget(self, action: #selector(switchValueChanged(_sender:)), for: UIControl.Event.valueChanged)
        
        self.view.addSubview(self.rightSwich)
        
        
        self.leftSwich = UISwitch()
        frame = self.leftSwich.frame
        frame.origin = CGPoint(x: screen.size.width - (frame.size.width + switchScreenSpace), y: 98)
        self.leftSwich.frame = frame
        self.leftSwich.isOn = true
        self.leftSwich.addTarget(self, action: #selector(switchValueChanged(_sender:)), for: UIControl.Event.valueChanged)
        self.view.addSubview(self.leftSwich)
        
        let segments:NSArray = ["Right","Left"]
        let segmentedControl:UISegmentedControl = UISegmentedControl(items: segments as? [Any])
        frame = CGRect(x: (screen.size.width - 220)/2.0, y: 186, width: 220, height: 29)
        segmentedControl.frame = frame
        segmentedControl.addTarget(self, action: #selector(touchDown(_sender:)), for: UIControl.Event.valueChanged)
        self.view.addSubview(segmentedControl)
        
        let slider:UISlider = UISlider(frame: CGRect(x: (screen.size.width - 300)/2.0, y: 298, width: 300, height: 31))
        slider .addTarget(self, action: #selector(sliderValueChange(_sender:)), for: UIControl.Event.valueChanged)
        slider.minimumValue = 0.0
        slider.maximumValue = 100.0
        slider.value = 50.0
        self.view.addSubview(slider)
        
        let lableSliderValue:UILabel = UILabel(frame: CGRect(x: slider.frame.origin.x, y: slider.frame.origin.y - 30, width: 103, height: 21))
        
        lableSliderValue.text = "SliderValue:"
        self.view.addSubview(lableSliderValue)
        
        self.sliderValue = UILabel(frame: CGRect(x: lableSliderValue.frame.origin.x + 120, y: lableSliderValue.frame.origin.y, width: 50, height: 21))
        self.sliderValue.text = "50"
        self.view.addSubview(self.sliderValue)
    }
    
    @objc func switchValueChanged(_sender:AnyObject) {
        let witchSwich:UISwitch = _sender as! UISwitch
        let setting:Bool = witchSwich.isOn
        self.leftSwich.isOn = setting
        self.rightSwich.setOn(setting, animated: true)
        
    }

    @objc func touchDown(_sender:AnyObject){
        let segmented:UISegmentedControl = _sender as! UISegmentedControl
        NSLog("选择的段:%li", segmented.selectedSegmentIndex)
        print("选择的段:",segmented.selectedSegmentIndex)
        if(self.leftSwich.isHidden){
            self.rightSwich.isHidden = false
            self.leftSwich.isHidden = false
        }else{
            self.leftSwich.isHidden = true
            self.rightSwich.isHidden = true
        }
    }
    
    @objc func sliderValueChange(_sender:AnyObject){
        let slider:UISlider = _sender as! UISlider
        let progressAsInt:Int = Int(slider.value)
        let newText = String(format: "%d", progressAsInt)
        self.sliderValue.text = newText
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
