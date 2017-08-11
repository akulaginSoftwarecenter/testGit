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
    
    dynamic var minute: Int = 0
    dynamic var title: String = ""
    dynamic var showNext: Bool = false
    let busStops = List<RNSBusStop>()
    dynamic var currentBusStops: RNSBusStop?
    
    dynamic var driver: String? = nil
    dynamic var conductor: String? = nil
    dynamic var depo: String? = nil
    dynamic var carrier: String? = nil
    dynamic var phone: String? = nil
    
    func generate() {
        minute = Int.rand(1, limit: 200)
        title = String(Int.rand(1, limit: 30))
        showNext = Bool.random
        
        latitude = 59.931448
        longitude = 30.292849
        
        let list = RNSBusStop.generateList
        busStops.append(objectsIn: list)
        currentBusStops = list.randomItem()
        
        driver = "Петров Сергей Иванович"
        conductor = "Константинова Василиана Валерьяновна"
        depo = "№1151 | E13222 777"
        carrier = "ООО ТРОЙКА"
        depo = "№1151 | E13222 777"
        phone = "+ 7 (912) 213-32-32"
    }
}
