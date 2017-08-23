//
//  Date+Utils.swift
//  RNIS
//
//  Created by Артем Кулагин on 22.08.17.
//  Copyright © 2017 Артем Кулагин. All rights reserved.
//

import Foundation

extension Date {
    
    var stringHHmm: String {
        return DateFormatter.HHmm.string(from: self)
    }
    
    func appendMinute(_ value: Int?) -> Date? {
       return dateByAddingUnit(.second, value: value ?? 0)
    }
    
    var stringDDMMyyyy_HHmm: String {
        return DateFormatter.DDMMyyyy_HHmm.string(from: self)
    }
    
    func dateByAddingUnit(_ unit: Calendar.Component, value: Int) -> Date? {
        return Calendar.current.date(byAdding: unit, value: value, to: self)
    }
}