//
//  CLLocationDistance+Utils.swift
//  RNIS
//
//  Created by Артем Кулагин on 13.11.17.
//  Copyright © 2017 Артем Кулагин. All rights reserved.
//

import Foundation

/**
 Расширение для CLLocationDistance
 */
extension CLLocationDistance {
    var toString: String {
        var string = ""
        var distance = self
        if distance > 999 {
            distance = distance/1000
            string = distance > 15000 ? String(format: "%.0f", distance) : String(format: "%.1f", distance)
            string = string + " " + "км"
        }else{
            string = String(format: "%.0f %@",distance, "м")
        }
        return string
    }
}
