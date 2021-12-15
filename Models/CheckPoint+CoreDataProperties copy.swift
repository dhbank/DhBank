//
//  CheckPoint+CoreDataProperties.swift
//  
//
//  Created by Diego Honorio on 17/11/21.
//
//

import Foundation
import CoreData


extension CheckPoint {

    @nonobjc public class func fetchRequest() -> NSFetchRequest<CheckPoint> {
        return NSFetchRequest<CheckPoint>(entityName: "CheckPoint")
    }

    @NSManaged public var checkpoint: Bool

}
