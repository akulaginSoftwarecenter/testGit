//
//  DateFormatter+Utils.swift
//  Spytricks
//
//  Created by Артем Кулагин on 17.03.17.
//  Copyright © 2017 Ivan Alekseev. All rights reserved.
//

import Foundation

/**
 Расширение для DateFormatter
 */
extension DateFormatter {
    
    static var textHHmm: String {
        return "HH:mm"
    }
    
    static var textDDMMyyyy: String {
        return "dd.MM.yyyy"
    }
    
    static var textTimestamp: String {
        return "yyyy-MM-dd"
    }
    
    static var textdMMMMyyyy: String {
        return "d MMMM yyyy"
    }
    
    static var HHmm: DateFormatter{
        return format(textHHmm)
    }
    
    static var DDMMyyyy: DateFormatter{
        return format(textDDMMyyyy)
    }
    
    static var DDMMyyyy_HHmm: DateFormatter{
        return format(textDDMMyyyy + " " + textHHmm)
    }
    
    static var E_d_MMMM: DateFormatter{
        return format("E d MMMM" + " / " + textHHmm)
    }
    
    static var timestamp: DateFormatter{
        return format(textTimestamp)
    }
    
    static var dMMMMyyyy: DateFormatter{
        return format(textdMMMMyyyy)
    }
   
    static func format(_ format: String) -> DateFormatter {
        let formatter = DateFormatter()
        formatter.dateFormat = format
        return formatter
    }
}
