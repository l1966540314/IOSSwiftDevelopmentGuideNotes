//
//  NoteManagedObject+CoreDataProperties.swift
//  CDMyNote
//
//  Created by Hao on 2019/5/10.
//  Copyright © 2019年 LIUHAO. All rights reserved.
//
//

import Foundation
import CoreData


extension NoteManagedObject {

    @nonobjc public class func fetchRequest() -> NSFetchRequest<NoteManagedObject> {
        return NSFetchRequest<NoteManagedObject>(entityName: "Note")
    }

    @NSManaged public var date: NSDate?
    @NSManaged public var content: String?

}
