//
//  BusStop.swift
//  RNIS
//
//  Created by Артем Кулагин on 07.08.17.
//  Copyright © 2017 Артем Кулагин. All rights reserved.
//

import Foundation
import RealmSwift

/**
 Класс остановки в базе
 */
class RNSBusStop: RNSCoordinateModel {
    
    @objc dynamic var name: String = ""
}
