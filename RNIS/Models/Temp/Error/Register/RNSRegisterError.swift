//
//  RNSRegisterError.swift
//  RNIS
//
//  Created by Артем Кулагин on 07.09.17.
//  Copyright © 2017 Артем Кулагин. All rights reserved.
//

import UIKit
import ObjectMapper

class RNSRegisterError: RNISMappableBase, RNSTextErrorProtocol {
    var mobile_user_phone: [String]?
    var mobile_user_new_phone: [String]?
    
    public override func mapping(map: Map) {
        
        mobile_user_phone <- map["mobile_user.phone"]
        mobile_user_phone = map.JSON["mobile_user.phone"] as? [String]
        
        mobile_user_new_phone = map.JSON["mobile_user.new_phone"] as? [String]
    }
    
    var textError: String? {
        var error = ""
        if let phone = mobile_user_phone?.first {
            error += " " + phone
        }
        if let mobile_user_new_phone = mobile_user_new_phone?.first {
            error += " " + mobile_user_new_phone
        }
        return error
    }
}
