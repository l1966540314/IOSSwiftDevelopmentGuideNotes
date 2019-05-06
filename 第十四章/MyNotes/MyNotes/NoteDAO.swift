//
//  NoteDAO.swift
//  MyNotes
//
//  Created by Hao on 2019/5/5.
//  Copyright © 2019年 LIUHAO. All rights reserved.
//

import UIKit

class NoteDAO: NSObject {
    private var dateFormatter = DateFormatter()
    private var plistFilePath:NSString!
    
    public static let sharedInstance: NoteDAO = {
        let instance = NoteDAO()
        instance.plistFilePath = instance.applicationDocumentsDirectoryFile()
        instance.dateFormatter.dateFormat = "yyyy-MM-dd HH:mm:ss"
        return instance
    }()
    
    private func applicationDocumentsDirectoryFile()->NSString{
        let documentDirectory = NSSearchPathForDirectoriesInDomains(FileManager.SearchPathDirectory.documentDirectory, FileManager.SearchPathDomainMask.userDomainMask, true).last
        let path = documentDirectory?.appendingFormat("NotesList.plist")
        return path! as NSString
    }
    
    private func createEditableCopyOfDatabaseIfNeeded(){
        let fileManager = FileManager.default
        if fileManager.fileExists(atPath: self.plistFilePath as String) == false{
            let frameworkBundle = Bundle(for: NoteDAO.self)
            let frameworkBundlePath = frameworkBundle.resourcePath
            let defaultDBPath = frameworkBundlePath?.appendingFormat("NotesList.plist")
            
            do{
                try fileManager.copyItem(atPath: defaultDBPath!, toPath: self.plistFilePath as String)
            } catch{
                let nserror = error as NSError
                NSLog("数据保存错误：%@", nserror.localizedDescription)
                assert(false,"错误写入数据")
            }
        }
    }
    
    public func creates(_ model:Note)->Int{
        let array = NSMutableArray(contentsOfFile: self.plistFilePath as String)
        let strDate = self.dateFormatter.string(from: model.date as Date)
        let dict = ["date" : strDate, "content" : model.content] as [String : Any]
        array?.add(dict)
        array?.write(toFile: self.plistFilePath as String, atomically: true)
        return 0
    }
    
    public func remove(_ model:Note)->Int{
        let array = NSMutableArray(contentsOfFile: self.plistFilePath as String)
        
        for item in array! {
            let dict = item as! NSDictionary
            let strDate = dict["date"] as! String
            let date = self.dateFormatter.date(from: strDate)
            
            if date == model.date as Date{
                array?.remove(dict)
                array?.write(toFile: self.plistFilePath as String, atomically: true)
                break
            }
        }
        
        return 0
    }
    
    public func modify(_ model:Note)->Int{
        let array = NSMutableArray(contentsOfFile: self.plistFilePath as String)
        
        for item in array! {
            let dict = item as! NSDictionary
            let strDate = dict["date"] as! String
            let date = self.dateFormatter.date(from: strDate)
            
            if date == model.date as Date{
                dict.setValue(model.content, forKey: "content")
                array?.write(toFile: self.plistFilePath as String, atomically: true)
                break
            }
        }
        
        return 0
    }
    
    public func findAll()->NSMutableArray{
        let array = NSArray(contentsOfFile: self.plistFilePath! as String)
    
        let listData = NSMutableArray()
        
        for item in array! {
            let dict = item as! NSDictionary
            let strDate = dict["date"]
            let date = self.dateFormatter.date(from: strDate as! String)
            let content = dict["content"]
            let note = Note(date: date! as NSDate, content: content as! NSString)
            
            listData.add(note)
        }
        return listData
    }
    
    public func findById(_ model:Note)->Note?{
        let array = NSArray(contentsOfFile: self.plistFilePath! as String)
        
        for item in array! {
            let dict = item as! NSDictionary
            let strDate = dict["date"]
            let date = self.dateFormatter.date(from: strDate as! String)
            let content = dict["content"]
            if date == model.date as Date{
                let note = Note(date: date! as NSDate, content: content as! NSString)
                return note
            }
        }
        return nil
    }
}
