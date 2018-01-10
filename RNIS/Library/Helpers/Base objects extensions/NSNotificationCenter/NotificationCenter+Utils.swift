//
//  NSNotificationCenter+Utils.swift
//  Solity-iOS
//
//  Created by Artem Kulagin on 23.09.16.
//  Copyright © 2016 el-machine. All rights reserved.
//

import Foundation

extension NotificationCenter {
    
    static var center: NotificationCenter {
        return NotificationCenter.default
    }
    
    static func post(_ name: String) {
        center.post(name: Notification.Name(rawValue: name), object: nil)
    }
    
    static func removeObserver(_ observer: Any) {
        center.removeObserver(observer)
    }
    
    static func addObserver(_ name: String, observer: Any, selector aSelector: Selector) {
        let name = NSNotification.Name(rawValue: name)
        center.removeObserver(observer, name: name, object: nil)
        center.addObserver(observer, selector:aSelector, name: name, object: nil)
    }
    
    static func addObserverTime(_ observer: Any, selector aSelector: Selector) {
        addObserver(kUpdateTime, observer: observer, selector: aSelector)
    }
    
    static func addObserverLocation(_ observer: Any, selector aSelector: Selector) {
        addObserver(kUpdateLocation, observer: observer, selector: aSelector)
    }
    
    static func addObserverUpdateFavorite(_ observer: Any, selector aSelector: Selector) {
        addObserver(kUpdateFavorite, observer: observer, selector: aSelector)
    }
    
    static func postTime() {
        post(kUpdateTime)
    }
    
    static func postLocation() {
        post(kUpdateLocation)
    }
    
    static func postUpdateFavorite() {
        post(kUpdateFavorite)
    }
}
