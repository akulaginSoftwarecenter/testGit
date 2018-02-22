//
//  RNISMappableBase.swift
//  RNIS
//
//  Created by Артем Кулагин on 24.07.17.
//  Copyright © 2017 Артем Кулагин. All rights reserved.
//

import UIKit
import ObjectMapper

/**
 RNISMappableBase
 */
class RNISMappableBase: Mappable {
    
    /// Метод инициализации 
    init() {
        
    }
    
    /// Метод инициализации
    required init?(map: Map) {
    }
    
    /// Метод парсинга
    public func mapping(map: Map) {
      
    }
}
