//
//  NSNotificationCenter+Utils.swift
//  Solity-iOS
//
//  Created by Artem Kulagin on 23.09.16.
//  Copyright © 2016 el-machine. All rights reserved.
//

import Foundation

extension NotificationCenter {
    
    static func post(_ name: String) {
        NotificationCenter.default.post(name: Notification.Name(rawValue: name), object: nil)
    }
    
    static func removeObserver(_ observer: Any) {
        NotificationCenter.default.removeObserver(observer)
    }
}