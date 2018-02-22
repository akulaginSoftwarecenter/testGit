//
//  RNSTraffickMark.swift
//  RNIS
//
//  Created by Артем Кулагин on 19.07.17.
//  Copyright © 2017 Артем Кулагин. All rights reserved.
//

import UIKit
import ObjectMapper

/**
 Класс трафика
 */
class RNSTraffickMarkData: Mappable {
    
    var cityNam: String?
    var lat: Double?
    var long: Double?
    var mark: Int?
    
    required init?(map: Map) {
        
    }
    
    func mapping(map: Map) {
        cityNam <- map["CITY_NAM"]
        lat <- map["Lat"]
        long <- map["Long"]
        mark = Int(map["Mark"].currentValue as? String ?? "")
    }
}
