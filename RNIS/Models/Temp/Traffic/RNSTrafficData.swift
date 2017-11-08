//
//  RNSTrafficData.swift
//  RNIS
//
//  Created by Артем Кулагин on 19.07.17.
//  Copyright © 2017 Артем Кулагин. All rights reserved.
//

import UIKit
import ObjectMapper

class RNSTrafficData: Mappable {
    
    var b: Float?
    var cities: [RNSTraffickMarkData]?
    var city: RNSTraffickMarkData?
    var updated_utc: Float?
    
    var marks: [RNSTraffickMarkData]? {
        if let cities = cities {
            return cities
        } else if let city = city  {
            return [city]
        }
        return nil
    }
    
    var averageMarks: Int {
        guard let marks = marks, marks.count > 0 else {
            return 0
        }
        var sum = 0
        for item in marks {
            sum += item.mark ?? 0
        }
        return Int(sum) / marks.count
    }
    
    required init?(map: Map) {
        
    }
    
    func mapping(map: Map) {
        b <- map["b"]
        cities <- map["cities"]
        city <- map["city"]
        updated_utc <- map["updated_utc"]
    }
}
