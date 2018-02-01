//
//  UserDefaults+Settings.swift
//  RNIS
//
//  Created by IvanLazarev on 28/09/2017.
//  Copyright © 2017 Артем Кулагин. All rights reserved.
//

import Foundation

extension UserDefaults {
    
    static let kFirstZoom = "firstZoom"
    static let kServerApi = "serverApi"
    
    static var isDidFirstZoom: Bool {
        return standard.bool(forKey: kFirstZoom)
    }
    
    static func firstZoomComplete() {
        return standard.set(true, forKey: kFirstZoom)
    }

    static var hideZoomButtonInMap: Bool {
        get {
            return UserDefaults.standard.bool(forKey: "Zoom")
        }
        set {
            UserDefaults.standard.setValue(newValue, forKey: "Zoom")
        }
    }
    
    static var serverApi: String? {
        return standard.string(forKey: kServerApi)
    }
    
    static func setServerApi(_ value: String) {
        print("setServerApi",value)
        standard.set(value, forKey: kServerApi)
    }
}
