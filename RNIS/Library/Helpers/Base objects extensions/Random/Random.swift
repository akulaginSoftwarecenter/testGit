//
//  Intswift.swift
//  RNIS
//
//  Created by Артем Кулагин on 10.08.17.
//  Copyright © 2017 Артем Кулагин. All rights reserved.
//

import Foundation

/**
 Расширение для случайных чисел Int
 */
extension Int {
    
    static func rand(_ offset: Int, limit: Int) -> Int {
        return Int(arc4random_uniform(UInt32(limit)) + UInt32(offset))
    }
}

/**
 Расширение для случайных чисел Bool
 */
extension Bool {
    static var random: Bool {
        return arc4random_uniform(2) == 0
    }
}

/**
 Расширение для случайных чисел Array
 */
extension Array {
    func randomItem() -> Element? {
        if isEmpty { return nil }
        let index = Int(arc4random_uniform(UInt32(self.count)))
        return self[index]
    }
}
