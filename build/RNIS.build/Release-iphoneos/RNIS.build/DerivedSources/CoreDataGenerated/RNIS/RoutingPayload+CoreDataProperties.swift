//
//  RoutingPayload+CoreDataProperties.swift
//  
//
//  Created by Артем Кулагин on 08.09.17.
//
//  This file was automatically generated and should not be edited.
//

import Foundation
import CoreData


extension RoutingPayload {

    @nonobjc public class func fetchRequest() -> NSFetchRequest<RoutingPayload> {
        return NSFetchRequest<RoutingPayload>(entityName: "RoutingPayload")
    }

    @NSManaged public var distance: Float
    @NSManaged public var route: NSObject?

}