//
//  CounterTime.swift
//  Solity-iOS
//
//  Created by Artem Kulagin on 15.11.16.
//  Copyright © 2016 el-machine. All rights reserved.
//

import UIKit

@objc
class CounterTime: NSObject {
    static var count_time_start = 0
    
    static var dateFormatter:DateFormatter {
        let dateFormatter = DateFormatter()
        dateFormatter.dateFormat = "A"
        return dateFormatter
    }
    
    static var countDate:Int {
        return Int(dateFormatter.string(from: Date()))!
    }
    
    static func startTimer() {
        count_time_start = countDate
        print("startTimer")
    }
    
    static func endTimer() {
        print("endTimer",countDate - count_time_start)
    }
}
