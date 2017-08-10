//
//  Intswift.swift
//  RNIS
//
//  Created by Артем Кулагин on 10.08.17.
//  Copyright © 2017 Артем Кулагин. All rights reserved.
//

import Foundation

extension Int {
    
    static func rand(_ offset: Int, limit: Int) -> Int {
        return Int(arc4random_uniform(UInt32(limit)) + UInt32(offset))
    }
}

extension Bool {
    static var random: Bool {
        return arc4random_uniform(2) == 0
    }
}
