//
//  RNSBus.swift
//  RNIS
//
//  Created by Артем Кулагин on 10.08.17.
//  Copyright © 2017 Артем Кулагин. All rights reserved.
//

import UIKit
import RealmSwift

class RNSBus: RNSCoordinateModel {
    
    @objc dynamic var minute: Int = 0
    @objc dynamic var route_number: String = ""
    @objc dynamic var showNext: Bool = false
    let busStops = List<RNSBusStop>()
    @objc dynamic var currentBusStops: RNSBusStop?
    
    @objc dynamic var driver: String? = nil
    @objc dynamic var conductor: String? = nil
    @objc dynamic var depo: String? = nil
    @objc dynamic var carrier: String? = nil
    @objc dynamic var phone: String? = nil
    
    func generate() {
        
        minute = Int.rand(1, limit: 200)
        route_number = String(Int.rand(1, limit: 30))
        showNext = Bool.random
        
        latitude = redPlaceLocation.coordinate.latitude
        longitude = redPlaceLocation.coordinate.longitude
        /*
        let list = RNSBusStop.generateList
        busStops.append(objectsIn: list)
        currentBusStops = list.randomItem()
        */
        driver = "Петров Сергей Иванович"
        conductor = "Константинова Василиана Валерьяновна"
        depo = "№1151 | E13222 777"
        carrier = "ООО ТРОЙКА"
        depo = "№1151 | E13222 777"
        phone = "+ 7 (912) 213-32-32"
    }
 
}
