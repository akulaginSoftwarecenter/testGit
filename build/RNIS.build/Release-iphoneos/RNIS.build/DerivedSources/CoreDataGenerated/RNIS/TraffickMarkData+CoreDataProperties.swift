//
//  TraffickMarkData+CoreDataProperties.swift
//  
//
//  Created by Артем Кулагин on 08.09.17.
//
//  This file was automatically generated and should not be edited.
//

import Foundation
import CoreData


extension TraffickMarkData {

    @nonobjc public class func fetchRequest() -> NSFetchRequest<TraffickMarkData> {
        return NSFetchRequest<TraffickMarkData>(entityName: "TraffickMarkData")
    }

    @NSManaged public var cityNam: String?
    @NSManaged public var lat: Double
    @NSManaged public var long: Double
    @NSManaged public var mark: Int16
    @NSManaged public var trafficDatas: TrafficData?
    @NSManaged public var trafficDatr: TrafficData?

}
