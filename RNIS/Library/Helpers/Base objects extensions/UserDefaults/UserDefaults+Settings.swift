//
//  UserDefaults+Settings.swift
//  RNIS
//
//  Created by IvanLazarev on 28/09/2017.
//  Copyright © 2017 Артем Кулагин. All rights reserved.
//

import Foundation

extension UserDefaults {

    static var hideZoomButtonInMap: Bool {
        get {
            return UserDefaults.standard.bool(forKey: "Zoom")
        }
        set {
            UserDefaults.standard.setValue(newValue, forKey: "Zoom")
        }
    }
}