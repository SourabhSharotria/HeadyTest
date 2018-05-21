//
//  DBProducts+CoreDataProperties.swift
//  
//
//  Created by Sourabh Sharotria on 21/05/18.
//
//

import Foundation
import CoreData


extension DBProducts {

    @nonobjc public class func fetchRequest() -> NSFetchRequest<DBProducts> {
        return NSFetchRequest<DBProducts>(entityName: "DBProducts")
    }

    @NSManaged public var productData: NSData?

}
