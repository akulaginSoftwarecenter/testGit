//
//  APIModel.swift
//  SwiftAPIWrapper
//
//  Created by Alexander Kozin on 27.03.16.
//  Copyright © 2016 el-machine. All rights reserved.
//

import Foundation

typealias APIModel = BaseModel

// MARK: - Parcing process
extension APIModel {
    func parcingDidStart() {

    }

    func cantFindKey(_ key: String, value: AnyObject?) {
        
    }

    func parcingDidEnd() {

    }

    override func setValue(_ value: Any?, forUndefinedKey key: String) {
        cantFindKey(key, value: value as AnyObject?)
    }
}

// MARK: - Mapping
extension APIModel {
    @nonobjc static var classMapping: [String: String]? = [:]

    static func mappingForClass(_ classString: String) -> String? {
        return classMapping?[classString]
    }

    static func mapClass(_ from: String, to:String) {
        classMapping?[from] = to
    }

    @nonobjc static var propertyMapping: [String: String]? = [:]

    static func mappingForProperty(_ property: String) -> String? {
        return propertyMapping?[property]
    }

    static func mapProperty(_ from: String, to:String) {
        propertyMapping?[from] = to
    }

    static func drainMappings() {
        classMapping = nil
        propertyMapping = nil
    }
}

// Model to dictionary
extension APIModel {

    func identifierObject() -> AnyObject {
        return self
    }

    func simpleObject() -> AnyObject {
        return identifierObject()
    }

    func fullObject() -> AnyObject {
        return simpleObject()
    }
    
}
