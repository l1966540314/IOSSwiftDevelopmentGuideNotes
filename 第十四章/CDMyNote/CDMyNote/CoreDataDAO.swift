//
//  CoreDataDAO.swift
//  CDMyNote
//
//  Created by Hao on 2019/5/10.
//  Copyright © 2019年 LIUHAO. All rights reserved.
//

import UIKit
import Foundation
import CoreData


class CoreDataDAO: NSObject {

    lazy var persistentContanier:NSPersistentContainer = {
        
       let container = NSPersistentContainer(name: "CDMyNote")
        container.loadPersistentStores(completionHandler: { (storeDescription, error) in
            let error = error as NSError?
            if error != nil{
                print("持久化存储容器错误：",error as Any)
            }
        })
        return container
    }()
    
    func saveContext(){
        let context = persistentContanier.viewContext
        if context.hasChanges{
            do{
                try context.save()
            } catch{
                let nserror = error as NSError
                print("数据保存错误：",nserror)
            }
        }
    }
    
    public func findAll()->NSMutableArray{
        let context = persistentContanier.viewContext
        
        let entity = NSEntityDescription.entity(forEntityName: "Note", in: context)
        
        let fetchRequest = NSFetchRequest<NSFetchRequestResult>()
        fetchRequest.entity = entity
        
        let sortDescriptor = NSSortDescriptor(key: "date", ascending: true)
        let sortDescriptors = [sortDescriptor]
        fetchRequest.sortDescriptors = sortDescriptors
        let resListData = NSMutableArray()
        
        do{
            let listData = try context.fetch(fetchRequest)
            
            if listData.count > 0{
                
                for item in listData{
                    let mo = item as! NoteManagedObject
                    let note = Note(date: mo.date!, content: mo.content! as NSString)
                    resListData.add(note)
                }
                return resListData
            }
        }catch{
            NSLog("查询数据失败")
        }
        
        return resListData
    }
    
    public func findById(_ model:Note)->Note?{
        let context = persistentContanier.viewContext
        
        let entity = NSEntityDescription.entity(forEntityName: "Note", in: context)
        
        let fetchRequest = NSFetchRequest<NSFetchRequestResult>()
        fetchRequest.entity = entity
        fetchRequest.predicate = NSPredicate(format: "date = %@", model.date)
        
        do{
           let listData = try context.fetch(fetchRequest)
            if listData.count > 0{
                let mo = listData[0] as! NoteManagedObject
                let note = Note(date: mo.date!, content: mo.content! as NSString)
                return note
            }
        }catch{
            NSLog("查询数据失败")
        }
        return nil
    }
    
    public func create(_ model:Note)->Int{
        let context = persistentContanier.viewContext
        
        let note = NSEntityDescription.insertNewObject(forEntityName: "Note", into: context) as! NoteManagedObject
        
        note.date = model.date
        note.content = model.content as String
        
        self.saveContext()
        
        return 0
    }
    
    public func remove(_ model:Note)->Int{
        let context = self.persistentContanier.viewContext
        
        let entityDescription = NSEntityDescription.entity(forEntityName: "Note", in: context)
        
        let request = NSFetchRequest<NSFetchRequestResult>()
        
        request.entity = entityDescription
        
        let predicate = NSPredicate(format: "date = %@", model.date)
        
        request.predicate = predicate
        
        do{
            let listData = try context.fetch(request)
            if listData.count > 0{
                let note = listData[0] as! NSManagedObject
                context.delete(note)
                self.saveContext()
            }
        }catch{
            NSLog("删除数据失败")
        }
        
        return 0
    }
    
    public func modify(_ model:Note)->Int{
        let context = persistentContanier.viewContext
        let entityDescription = NSEntityDescription.entity(forEntityName: "Note", in: context)
        
        let request = NSFetchRequest<NSFetchRequestResult>()
        request.entity = entityDescription
        
        let predicate = NSPredicate(format: "date = %@",model.date)
        request.predicate = predicate
        
        do{
            let listData = try context.fetch(request)
            
            if listData.count > 0{
                let note = listData[0] as! NoteManagedObject
                
                note.content = model.content as String
                
                self.saveContext()
            }
            
        }catch{
            NSLog("修改数据失败")
        }
        
        return 0
    }
}
