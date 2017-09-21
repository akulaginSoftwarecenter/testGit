//
//  Parser.swift
//  SwiftAPIWrapper
//
//  Created by Alexander Kozin on 27.03.16.
//  Copyright © 2016 el-machine. All rights reserved.
//

import Foundation

class Parser {
    static let executableName = Bundle.main.infoDictionary!["CFBundleExecutable"] as! String

    /**
     Parses array of objects
     Calls objectFromDictionary: iteratively

     - parameter modelClass: Class for parsing data to
     - parameter array:      Array of dictionaries that represent an object

     - returns: Array of parsed objects
     */
    class func modelsFromArray(_ modelClass: APIModel.Type, array: [AnyObject]) -> [APIModel] {
        var models = [APIModel]()
        models.reserveCapacity(array.count)

        for (_, source) in array.enumerated() {
            models.append(modelFromSourceObject(modelClass, source: source)!)
        }

        modelClass.drainMappings()

        return models
    }

    /**
     Parses object with property values filled according to source object

     - parameter modelClass: Class for parsing data to
     - parameter source:     Source dictionary which represents object

     - returns: Parsed object
     */
    class func modelFromSourceObject(_ modelClass: APIModel.Type, source: AnyObject) -> APIModel? {
        let model = modelFromSourceObjectWithoutDrain(modelClass, source: source)
        modelClass.drainMappings()

        return model
    }

    /**
     We should use this private method for parcing arrays
     Because public method drains mappings after every parse
     */
    class func modelFromSourceObjectWithoutDrain(_ modelClass: APIModel.Type, source: AnyObject) -> APIModel? {

        let dictionary = source as! [String: AnyObject]

        let model: APIModel?
        if dictionary.isEmpty {
            model = nil
        } else {
            model = modelClass.init()

            for (key, value) in dictionary.enumerated() {
                //!value.isEmpty {
                parseValue(model!, value: value as AnyObject, forKey: String(key))
                //                }
            }
        }
        
        return model
    }

    @nonobjc static func parseValue(_ model: APIModel, value: AnyObject, forKey key: String) {

        // We should use mapping because some values should be saved to different keys
        // E.g. we should save value for key 'id' to key 'uid'
        // That's why we should use mapping
        // If key isn't exist in map we should convert it from backend representation
        // To our camel style

        // Try to find property name in mapping first
        let modelType = APIModel.self
        var keyToSet = modelType.mappingForProperty(key)
        if keyToSet == nil {
            // Convert key to property name
            keyToSet = propertyFromBackendKey(key)

            // And save it to mapping
            modelType.mapProperty(key, to: keyToSet!)
        }

        // Firstly we should check maybe key is a some our class?
        // Try to convert key to model class
        // Try to find class in mapping first

        var valueClassName = modelType.mappingForClass(key)
        // If can't find
        if valueClassName == nil {
            // Convert key to class name
            valueClassName = classNameFromBackendKey(key)

            // And save it to mapping
            // Don't care it's class or not, just cache it to prevent converting again
            modelType.mapClass(key, to: keyToSet!)
        }

        let valueToSet: AnyObject?

        // If class exist, parse value to model
        if let valueClass = swiftClassFromString(valueClassName!) {
            valueToSet = Parser.modelFromSourceObjectWithoutDrain((valueClass as! APIModel.Type),
                                                                source: value as! [String : AnyObject] as AnyObject)
        } else {
            valueToSet = value
        }

        // And set value (parsed or not) to property
        model.setValue(valueToSet, forKey: keyToSet!)
    }

    /**
     *  Parses API reply
     *  Calls objectsFromArray: for arrays and objectFromDictionary: for dictionaries
     *
     *  @param reply Reply from API to parse
     *
     *  @return Parsed object or array of objects
     */
//    + (id)objectFromReply:(id)reply;

    static func swiftClassFromString(_ className: String) -> AnyClass? {
        return NSClassFromString(executableName + "." + className)
    }
}

// Model to dictionary
extension Parser {
    static func dictionary(forModel model: BaseModel,
                             andKeys keys:[String]) -> [String: AnyObject] {
        return [String: AnyObject]()
    }
}

protocol ParsableObject {
    func valueForAPI() -> AnyObject
}

extension NSObject: ParsableObject {
    @objc func valueForAPI() -> AnyObject {
        return self
    }
}

extension APIModel {
    override func valueForAPI() -> AnyObject {
        return self.fullObject()
    }

}

extension Array: ParsableObject {
    func valueForAPI() -> AnyObject {
        var valueForAPI = [AnyObject]()
        valueForAPI.reserveCapacity(self.count)

        for object in self {
            valueForAPI.append((object as! NSObject).valueForAPI())
        }
        return valueForAPI as AnyObject
    }

}

extension Dictionary: ParsableObject {
    func valueForAPI() -> AnyObject {
        var valueForAPI = [Key: AnyObject](minimumCapacity: self.count)
        for (key, value) in self {
            valueForAPI[key] = ((value as! NSObject).valueForAPI())
        }

        return valueForAPI as AnyObject
    }

}
