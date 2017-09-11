//
//  RNSContactItem.swift
//  RNIS
//
//  Created by Артем Кулагин on 08.09.17.
//  Copyright © 2017 Артем Кулагин. All rights reserved.
//

import UIKit
import ObjectMapper

enum RNSContactItemType: String {
    case phone = "phone"
    case email = "email"
}

class RNSContactItem: RNISMappableBase {
    var uuid: String?
    var type: String?
    var name: String?
    var value: String?
    var value_type: String?
    
    public override func mapping(map: Map) {
        uuid <- map["uuid"]
        type <- map["type"]
        name <- map["name"]
        value <- map["value"]
        value_type <- map["value_type"]
    }
    
    var contactType: RNSContactItemType {
        return RNSContactItemType(rawValue: value_type ?? "") ?? .phone
    }
    
    var isPhone: Bool {
        return contactType == .phone
    }
    
    var height: CGFloat {
        let defaultHaight = CGFloat(86)
        var height = heightText + 46
        if height < defaultHaight {
            height = defaultHaight
        }
        return height
    }
    
    var heightText: CGFloat {
        let width = UIScreen.width - 25 - 65
        return name?.height(.cffazm18, width: width) ?? 0
    }
 }
