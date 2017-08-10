//
//  BusStop.swift
//  RNIS
//
//  Created by Артем Кулагин on 07.08.17.
//  Copyright © 2017 Артем Кулагин. All rights reserved.
//

import Foundation
import RealmSwift

class RNSBusStop: RNSCoordinateModel {
    
    dynamic var title: String = ""
    
    func generate() {
        title = "бул. Конногвардейский"
        latitude = 59.9344377
        longitude = 30.3010831
    }
}
