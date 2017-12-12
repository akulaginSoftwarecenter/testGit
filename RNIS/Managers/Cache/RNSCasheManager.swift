//
//  RNSCasheManager.swift
//  RNIS
//
//  Created by Артем Кулагин on 12.12.2017.
//  Copyright © 2017 Артем Кулагин. All rights reserved.
//

import UIKit

class RNSCasheManager: NSObject {
    static var cache = NSCache<NSString,AnyObject>()
    
    static func setObject(_ object: AnyObject?, key: String?) {
        guard let object = object, let key = key else {
            return
        }
        cache.setObject(object, forKey: key as NSString)
    }
    
    static func object(_ key: String?) -> AnyObject? {
        guard let key = key else {
            return nil
        }
        return cache.object(forKey: key as NSString)
    }
}
