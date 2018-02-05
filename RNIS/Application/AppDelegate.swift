//
//  AppDelegate.swift
//  RNIS
//
//  Created by Артем Кулагин on 18.07.17.
//  Copyright © 2017 Артем Кулагин. All rights reserved.
//

import UIKit
import CoreData
import Fabric
import Crashlytics

@UIApplicationMain
class AppDelegate: UIResponder, UIApplicationDelegate {

    var window: UIWindow?

    func application(_ application: UIApplication, didFinishLaunchingWithOptions launchOptions: [UIApplicationLaunchOptionsKey: Any]?) -> Bool {
        RNISAuthManager.prepareDefaultUrlIfNeed()
        Fabric.with([Answers.self, Crashlytics.self])
        RNSTimeManager()
        STPushManager.check()
        return true
    }
    
    func application(_ application: UIApplication, didRegisterForRemoteNotificationsWithDeviceToken deviceToken: Data)  {
        let bytes = UnsafeBufferPointer<UInt8>(start: (deviceToken as NSData).bytes.bindMemory(to: UInt8.self, capacity: deviceToken.count), count:deviceToken.count)
        let token = bytes.map { String(format: "%02hhx", $0) }.reduce("", { $0 + $1 })
        UserDefaults.setPushToken(token)
        STPushManager.send()
        print("Push token",token)
    }
    
    func application(_ application: UIApplication, didReceiveRemoteNotification userInfo: [AnyHashable: Any], fetchCompletionHandler completionHandler: @escaping (UIBackgroundFetchResult) -> Void) {
        print("didReceiveRemoteNotification",userInfo)
    }
}

