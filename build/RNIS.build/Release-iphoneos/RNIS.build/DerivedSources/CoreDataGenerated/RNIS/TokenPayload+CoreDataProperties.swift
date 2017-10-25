//
//  TokenPayload+CoreDataProperties.swift
//  
//
//  Created by Admin on 25.10.17.
//
//  This file was automatically generated and should not be edited.
//

import Foundation
import CoreData


extension TokenPayload {

    @nonobjc public class func fetchRequest() -> NSFetchRequest<TokenPayload> {
        return NSFetchRequest<TokenPayload>(entityName: "TokenPayload")
    }

    @NSManaged public var token: String?

}
