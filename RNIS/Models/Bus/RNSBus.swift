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
    dynamic var num: Int = 0
    dynamic var showNext: Bool = false
    
    func stubBus() {
        generate()
        latitude = 59.931448
        longitude = 30.292849
    }
    
    func generate() {
        minute = Int.rand(1, limit: 200)
        num = Int.rand(1, limit: 30)
        showNext = Bool.random
    }
}
