//
//  DateFormatter+Utils.swift
//  Spytricks
//
//  Created by Артем Кулагин on 17.03.17.
//  Copyright © 2017 Ivan Alekseev. All rights reserved.
//

import Foundation

extension DateFormatter {
    
    static var textHHmm: String {
        return "HH:mm"
    }
    
    static var textDDMMyyyy: String {
        return "dd.MM.yyyy"
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
    /*
    static var DDMMyyyy_HHmm: DateFormatter{
        return format("d MMMM" + " / " + textHHmm)
    }
    */
    static func format(_ format: String) -> DateFormatter {
        let formatter = DateFormatter()
        formatter.dateFormat = format
        return formatter
    }
}
