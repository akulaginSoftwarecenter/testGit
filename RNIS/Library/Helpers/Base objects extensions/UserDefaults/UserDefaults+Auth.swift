//
//  UserDefaults+Auth.swift
//  Spytricks
//
//  Created by Артем Кулагин on 13.04.17.
//  Copyright © 2017 Ivan Alekseev. All rights reserved.
//

import Foundation

extension UserDefaults {
    
    static let kToken = "token"
    
    static var token:String? {
        return standard.string(forKey: kToken)
    }
     
    static func setToken(_ value: String) {
        standard.set(value, forKey: kToken)
    }
    
    static func removeToken() {
        standard.removeObject(forKey: kToken)
    }
}
