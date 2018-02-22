//
//  CounterTime.swift
//  Solity-iOS
//
//  Created by Artem Kulagin on 15.11.16.
//  Copyright © 2016 el-machine. All rights reserved.
//

import UIKit

@objc
/**
 Класс подсчета времения выполения
 */
class CounterTime: NSObject {
    
    /// переменная сохранения времения старта
    static var count_time_start = 0
    
    /// переменная дата форматтера
    static var dateFormatter:DateFormatter {
        let dateFormatter = DateFormatter()
        dateFormatter.dateFormat = "A"
        return dateFormatter
    }
    
    /// переменная количества милисекунд
    static var countDate:Int {
        return Int(dateFormatter.string(from: Date()))!
    }
    
    /// Метод старта таймера
    static func startTimer() {
        count_time_start = countDate
        print("startTimer")
    }
    
    /// Метод конца таймера
    static func endTimer() {
        print("endTimer",countDate - count_time_start)
    }
}
