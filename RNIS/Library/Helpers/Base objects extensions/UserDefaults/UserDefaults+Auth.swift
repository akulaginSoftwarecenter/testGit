//
//  UserDefaults+Auth.swift
//  Spytricks
//
//  Created by Артем Кулагин on 13.04.17.
//  Copyright © 2017 Ivan Alekseev. All rights reserved.
//

import Foundation

/**
 Расширение для UserDefaults
 */
extension UserDefaults {
    
    static let kLaunchedBefore = "launchedBefore"
    
    static let kLoginField = "loginField"
    static let kPasswordField = "passwordField"
    static let kToken = "token"
    static let kUuid = "uuid"
    static let kEmailField = "EmailField"
    static let kPushToken = "PushToken"
    
    /// переменная уникальный идентификатор сущности
    static var uuid: String? {
        return standard.string(forKey: kUuid)
    }
    
    static var isHaveToken: Bool {
        return token != nil
    }
    
    static var isHaveEmail: Bool {
        return email != nil
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
    
    static var email: String? {
        return standard.string(forKey: kEmailField)
    }
    
    static var pushToken:String? {
        return standard.string(forKey: kPushToken)
    }
    
    static func setToken(_ value: String) {
        print("new token",value)
        standard.set(value, forKey: kToken)
        STPushManager.check()
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
    
    static func setEmail(_ value: String?) {
        standard.set(value, forKey: kEmailField)
    }
    
    static func setPassword(_ value: String?) {
        standard.set(value, forKey: kPasswordField)
    }
    
    static func setPushToken(_ value:String?) {
        standard.set(value, forKey: kPushToken)
    }
    
    static func removeUserData() {
        removeToken()
        removeEmail()
    }
    
    static func removeToken() {
        standard.removeObject(forKey: kToken)
    }
    
    static func removeEmail() {
        standard.removeObject(forKey: kEmailField)
    }
    
    static func removeLogin() {
        standard.removeObject(forKey: kLoginField)
    }
    
    static func removePassword() {
        standard.removeObject(forKey: kPasswordField)
    }
}
