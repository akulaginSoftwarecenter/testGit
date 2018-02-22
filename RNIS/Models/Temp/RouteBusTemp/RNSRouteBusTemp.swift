//
//  RNSRouteBusTemp.swift
//  RNIS
//
//  Created by Артем Кулагин on 14.09.17.
//  Copyright © 2017 Артем Кулагин. All rights reserved.
//

import UIKit

class RNSRouteBusTemp: RNISMappableBase {
    var route_number: String?
    var time: Int?
    var timePerod: Int?
    
    /// Метод инициализации 
    convenience init(_ route_number: String?, time: Int?, timePerod: Int?) {
        self.init()
        
        self.route_number = route_number
        self.time = time
        self.timePerod = timePerod
    }
}
