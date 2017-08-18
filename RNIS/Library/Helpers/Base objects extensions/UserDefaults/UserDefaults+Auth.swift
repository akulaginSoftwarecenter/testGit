//
//  UserDefaults+Auth.swift
//  Spytricks
//
//  Created by Артем Кулагин on 13.04.17.
//  Copyright © 2017 Ivan Alekseev. All rights reserved.
//

import Foundation

extension UserDefaults {
    
    static let kLaunchedBefore = "launchedBefore"
    
    static let kToken = "token"
    
    static var token:String? {
        return standard.string(forKey: kToken)
    }
    
    static var launchedBefore:Bool {
        return standard.bool(forKey: kLaunchedBefore)
    }
     
    static func setToken(_ value: String) {
        standard.set(value, forKey: kToken)
    }
    
    static func setLaunchedBeforeComplete() {
        standard.set(true, forKey: kLaunchedBefore)
    }
    
    static func removeToken() {
        standard.removeObject(forKey: kToken)
    }
}
