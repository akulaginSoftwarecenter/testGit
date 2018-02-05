//
//  STPushManager.swift
//  Spytricks
//
//  Created by Артем Кулагин on 10.10.17.
//  Copyright © 2017 Ivan Alekseev. All rights reserved.
//

import UIKit

class STPushManager: NSObject {
    
    static var pushToken: String? {
        return UserDefaults.pushToken
    }
    
    static func check() {
        if pushToken == nil {
            let settings = UIUserNotificationSettings(types: [.alert, .badge, .sound], categories: nil)
            let app = UIApplication.shared
            app.registerUserNotificationSettings(settings)
            app.registerForRemoteNotifications()
        }
        send()
    }
    
    static func send() {
        RNSPushTokenUpdate { (reply, error, value) in
            print("RNSPushTokenUpdate reply", reply as Any);
            print("RNSPushTokenUpdate error", error as Any);
        }
    }
}
