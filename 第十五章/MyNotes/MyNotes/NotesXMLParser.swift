//
//  NotesXMLParser.swift
//  MyNotes
//
//  Created by Hao on 2019/5/15.
//  Copyright © 2019年 LIUHAO. All rights reserved.
//

import UIKit

class NotesXMLParser: NSObject,XMLParserDelegate {

    private var listData:NSMutableArray!
    private var currentTagName:String!
    
    func start(){
        let path = Bundle.main.path(forResource: "Notes", ofType: "xml")
        let url = URL(fileURLWithPath: path!)
        let parser = XMLParser(contentsOf: url)
        parser?.delegate = self
        parser?.parse()
    }
    
//MARK-XMLParserDelegate
    func parserDidStartDocument(_ parser: XMLParser) {
        self.listData = NSMutableArray()
    }
    func parser(_ parser: XMLParser, parseErrorOccurred parseError: Error) {
        print(parseError)
    }
    func parser(_ parser: XMLParser, didStartElement elementName: String, namespaceURI: String?, qualifiedName qName: String?, attributes attributeDict: [String : String] = [:]) {
        self.currentTagName = elementName
        if self.currentTagName == "Note"{
            let identifier = attributeDict["id"]
            let dict = NSMutableDictionary()
            dict["id"] = identifier
            self.listData.add(dict)
        }
    }
    func parser(_ parser: XMLParser, foundCharacters string: String) {
       let str = string.trimmingCharacters(in: CharacterSet.whitespacesAndNewlines)
        if str == ""{
            return
        }
        let dict = self.listData.lastObject as! NSMutableDictionary
        if self.currentTagName == "CDate"{
            dict["CDate"] = string
        }
        
        if self.currentTagName == "Content"{
            dict["Content"] = string
        }
        
        if self.currentTagName == "UserID"{
            dict["UserID"] = string
        }
    }
    func parser(_ parser: XMLParser, didEndElement elementName: String, namespaceURI: String?, qualifiedName qName: String?) {
        self.currentTagName = nil
    }
    func parserDidEndDocument(_ parser: XMLParser) {
        print("NSXML解析完成...")
        NotificationCenter.default.post(name: NSNotification.Name(rawValue: "reloadViewNotification"), object: self.listData, userInfo: nil)
    }
}
