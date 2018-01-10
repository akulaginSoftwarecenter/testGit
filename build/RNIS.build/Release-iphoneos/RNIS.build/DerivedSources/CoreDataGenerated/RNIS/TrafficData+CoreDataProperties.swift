//
//  TrafficData+CoreDataProperties.swift
//  
//
//  Created by Артем Кулагин on 10.01.2018.
//
//  This file was automatically generated and should not be edited.
//

import Foundation
import CoreData


extension TrafficData {

    @nonobjc public class func fetchRequest() -> NSFetchRequest<TrafficData> {
        return NSFetchRequest<TrafficData>(entityName: "TrafficData")
    }

    @NSManaged public var b: Float
    @NSManaged public var updated_utc: Float
    @NSManaged public var cities: NSSet?
    @NSManaged public var city: TraffickMarkData?

}

// MARK: Generated accessors for cities
extension TrafficData {

    @objc(addCitiesObject:)
    @NSManaged public func addToCities(_ value: TraffickMarkData)

    @objc(removeCitiesObject:)
    @NSManaged public func removeFromCities(_ value: TraffickMarkData)

    @objc(addCities:)
    @NSManaged public func addToCities(_ values: NSSet)

    @objc(removeCities:)
    @NSManaged public func removeFromCities(_ values: NSSet)

}
