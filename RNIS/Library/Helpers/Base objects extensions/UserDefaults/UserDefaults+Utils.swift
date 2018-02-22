//
//  UserDefaults+Utils.swift
//  Spytricks
//
//  Created by Артем Кулагин on 10.02.17.
//  Copyright © 2017 Ivan Alekseev. All rights reserved.
//

import Foundation

/**
 Расширение для UserDefaults
 */
extension UserDefaults {
    
    open override static func setValue(_ value: Any?, forKey key: String) {
        standard.setValue(value, forKey: key)
        standard.synchronize()
    }
}
