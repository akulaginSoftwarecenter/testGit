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
    
    var stringE_d_MMMM: String {
        return DateFormatter.E_d_MMMM.string(from: self)
    }
    
    var stringdMMMMyyyy: String {
        return DateFormatter.dMMMMyyyy.string(from: self)
    }
   
    func appendMinute(_ value: Int?) -> Date? {
       return dateByAddingUnit(.minute, value: value ?? 0)
    }
    
    func appendDay(_ value: Int?) -> Date? {
        return dateByAddingUnit(.day, value: value ?? 0)
    }
    
    var stringDDMMyyyy_HHmm: String {
        return DateFormatter.DDMMyyyy_HHmm.string(from: self)
    }
    
    func dateByAddingUnit(_ unit: Calendar.Component, value: Int) -> Date? {
        return Calendar.current.date(byAdding: unit, value: value, to: self)
    }
}
