//
//  NoteDAO.swift
//  MyNotes
//
//  Created by Hao on 2019/5/5.
//  Copyright © 2019年 LIUHAO. All rights reserved.
//

import UIKit
import Foundation
let DBFILE_NAME = "NotesList.sqlite3"

class NoteDAO: NSObject {
    private var dateFormatter = DateFormatter()
    private var plistFilePath:NSString!
    private var db:OpaquePointer? = nil
    
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
    //MARK:数据库部分
    private func createEditableCopyOfDatabaseIfNeededs(){
        let cpath = self.plistFilePath.cString(using: String.Encoding.utf8.rawValue)
        if sqlite3_open(cpath, &db) != SQLITE_OK{
            NSLog("数据库打开失败")
        }else{
            let sql = "CREATE TABLE IF NOT EXISTS Note (cdate TEXT PRIMARY KEY, content TEXT)"
            
            let cSql = sql.cString(using: String.Encoding(rawValue: String.Encoding.utf8.rawValue))
            if sqlite3_exec(db, cSql!, nil, nil, nil) != SQLITE_OK{
                NSLog("建表失败")
            }
        }
        sqlite3_close(db)
    }
    
    public func findByIds(_ model:Note)->Note?{
        let cpath = self.plistFilePath.cString(using: String.Encoding.utf8.rawValue)
        if sqlite3_open(cpath, &db) != SQLITE_OK{
            NSLog("数据库打开失败")
        }else{
            let sql = "SELECT cdate,content FROM Note where cdate =?"
            let cSql = sql.cString(using: String.Encoding(rawValue: String.Encoding.utf8.rawValue))
            var statement:OpaquePointer? = nil
            if sqlite3_prepare_v2(db, cSql, -1, &statement, nil) == SQLITE_OK{
                let strDate = self.dateFormatter.string(from: model.date as Date)
                let cDate = strDate.cString(using: String.Encoding.utf8)
                
                sqlite3_bind_text(statement, 1, cDate, -1, nil)
                
                if sqlite3_step(statement) == SQLITE_ROW{
                    
                    let note = Note()
                    
                    let strDate = getColumValue(index: 0, stmt: statement!)
                    if strDate != nil{
                        let date = self.dateFormatter.date(from: strDate!)
                        note.date = date! as NSDate
                    }
                    
                    let strContent = getColumValue(index: 1, stmt: statement!)
                    if strContent != nil{
                        note.content = strContent! as NSString
                    }
                    sqlite3_finalize(statement)
                    sqlite3_close(db)
                    
                    return note
                }
            }
            sqlite3_finalize(statement)
        }
        
        sqlite3_close(db)
        return nil
    }
    
    private func getColumValue(index:CInt, stmt:OpaquePointer)->String?{
        let ptr = UnsafeRawPointer.init(sqlite3_column_text(stmt, index))
        if ptr != nil{
            let uptr = ptr?.bindMemory(to: CChar.self, capacity: 0)
            let txt = String(validatingUTF8: uptr!)
            return txt!
        }
        return nil
    }
    
    public func findAlls()->NSMutableArray{
        let cpath = self.plistFilePath.cString(using: String.Encoding.utf8.rawValue)
        let listData = NSMutableArray()
        
        if sqlite3_open(cpath, &db) != SQLITE_OK{
            NSLog("打开数据库失败")
        }else{
            let sql = "SELECT cdate,content FROM Note"
            let cSql = sql.cString(using: String.Encoding(rawValue: String.Encoding.utf8.rawValue))
            
            var statement:OpaquePointer? = nil
            
            if sqlite3_prepare_v2(db, cSql, -1, &statement, nil) == SQLITE_OK{
                
                while sqlite3_step(statement) == SQLITE_ROW{
                    let strDate = self.getColumValue(index: 0, stmt: statement!)
                    let date = self.dateFormatter.date(from: strDate!)
                    
                    let strContent = getColumValue(index: 1, stmt: statement!)
                    
                    let note = Note(date: date! as NSDate, content: strContent! as NSString)
                    
                    listData.add(note)
                }
                
                sqlite3_finalize(statement)
                sqlite3_close(db)
                return listData
            }
           sqlite3_finalize(statement)
        }
        sqlite3_close(db)
        return listData
    }
    
    
    public func createss(_ model:Note)->Int{
        let cpath = self.plistFilePath.cString(using: String.Encoding.utf8.rawValue)
        if sqlite3_open(cpath, &db) != SQLITE_OK{
            NSLog("数据库打开失败")
        }else{
            let sql = "INSERT OR REPLACE INTO note (cdate,content)  VALUES (?,?)"
            let cSql = sql.cString(using: String.Encoding(rawValue: String.Encoding.utf8.rawValue))
            var statement:OpaquePointer? = nil
            if sqlite3_prepare_v2(db, cSql, -1, &statement, nil) == SQLITE_OK{
                let strDate = self.dateFormatter.string(from: model.date as Date)
                let cDate = strDate.cString(using: String.Encoding.utf8)
                let cContent = model.content.cString(using: String.Encoding.utf8.rawValue)
                
                sqlite3_bind_text(statement, 1, cDate, -1, nil)
                sqlite3_bind_text(statement, 2, cContent, -1, nil)
                
                if sqlite3_step(statement!) != SQLITE_DONE{
                    NSLog("插入数据失败")
                }
            }
            sqlite3_finalize(statement!)
        }
        sqlite3_close(db)
        return 0
    }
    
    public func removes(_ model:Note)->Int{
        let cpath = self.plistFilePath.cString(using: String.Encoding.utf8.rawValue)
        if sqlite3_open(cpath, &db) != SQLITE_OK{
            NSLog("数据库打开失败")
        }else{
            let sql = "DELETE from note where cdate =?"
            let cSql = sql.cString(using: String.Encoding(rawValue: String.Encoding.utf8.rawValue))
            
            var statement:OpaquePointer? = nil
            if sqlite3_prepare_v2(db, cSql, -1, &statement, nil) == SQLITE_OK{
                
                let strDate = self.dateFormatter.string(from: model.date as Date)
                let cDate = strDate.cString(using: String.Encoding(rawValue: String.Encoding.utf8.rawValue))
                
                sqlite3_bind_text(statement, 1, cDate, -1, nil)
                
                if sqlite3_step(statement!) != SQLITE_DONE{
                    NSLog("删除数据失败。")
                }
            }
            sqlite3_step(statement!)
        }
        sqlite3_close(db)
        return 0
    }
    
    public func modifys(_ model:Note)->Int{
    
        let cpath = self.plistFilePath.cString(using: String.Encoding.utf8.rawValue)
        
        if sqlite3_open(cpath, &db) != SQLITE_OK{
          NSLog("数据库打开失败")
        }else{
            let sql = "UPDATE note set content=? where cdate =?"
            let cSql = sql.cString(using: String.Encoding(rawValue: String.Encoding.utf8.rawValue))
            var statement:OpaquePointer? = nil
            if sqlite3_prepare_v2(db, cSql, -1, &statement, nil) == SQLITE_OK{
                let  strDate = self.dateFormatter.string(from: model.date as Date)
                let  cDate = strDate.cString(using: String.Encoding(rawValue: String.Encoding.utf8.rawValue))
                
                let cContent = model.content.cString(using: String.Encoding.utf8.rawValue)
                
                sqlite3_bind_text(statement, 1, cContent, -1, nil)
                sqlite3_bind_text(statement, 2, cDate, -1, nil)
                
                if sqlite3_step(statement) == SQLITE_DONE{
                    NSLog("修改数据失败")
                }
            }
            sqlite3_finalize(statement!)
        }
        sqlite3_close(db)
        return 0
    }
}




