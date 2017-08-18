//
//  RNSTableStopsModel.swift
//  RNIS
//
//  Created by Артем Кулагин on 18.08.17.
//  Copyright © 2017 Артем Кулагин. All rights reserved.
//

import UIKit
import RealmSwift

class RNSTableStopsModel {
    
    var item: RNSBus?
        
    init(_ item: RNSBus?) {
        self.item  = item
        prepareItems()
    }
    
    func prepareItems() {
        
    }
}
