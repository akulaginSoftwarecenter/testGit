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
    
    static let kLoginField = "loginField"
    static let kPasswordField = "passwordField"
    static let kToken = "token"
    static let kUuid = "uuid"
    
    static var uuid: String? {
        return standard.string(forKey: kUuid)
    }
    
    static var isHaveToken: Bool {
        return token != nil
    }
    
    static var token: String? {
        return standard.string(forKey: kToken)
    }
    
    static var launchedBefore: Bool {
        return standard.bool(forKey: kLaunchedBefore)
    }
    
    static var login: String? {
        return standard.string(forKey: kLoginField)
    }
    
    static var password: String? {
        return standard.string(forKey: kPasswordField)
    }
     
    static func setToken(_ value: String) {
        print("new token",value)
        standard.set(value, forKey: kToken)
    }
    
    static func setUuid(_ value: String) {
        standard.set(value, forKey: kUuid)
    }
    
    static func setLaunchedBeforeComplete() {
        standard.set(true, forKey: kLaunchedBefore)
    }
    
    static func setLogin(_ value: String?) {
        standard.set(value, forKey: kLoginField)
    }
    
    static func setPassword(_ value: String?) {
        standard.set(value, forKey: kPasswordField)
    }
    
    static func removeToken() {
        standard.removeObject(forKey: kToken)
    }
    
    static func removeLogin() {
        standard.removeObject(forKey: kLoginField)
    }
    
    static func removePassword() {
        standard.removeObject(forKey: kPasswordField)
    }
}
