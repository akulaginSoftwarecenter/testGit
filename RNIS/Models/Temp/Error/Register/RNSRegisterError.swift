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
    var mobile_user_new_email: [String]?
    
    var favorite_path_data: [String]?
    var favorite_path_name: [String]?
    
    public override func mapping(map: Map) {
        
        mobile_user_phone <- map["mobile_user.phone"]
        mobile_user_phone = map.JSON["mobile_user.phone"] as? [String]
        
        mobile_user_new_phone = map.JSON["mobile_user.new_phone"] as? [String]
        mobile_user_new_email = map.JSON["mobile_user.new_email"] as? [String]
        
        favorite_path_data = map.JSON["favorite_path.data"] as? [String]
        favorite_path_name = map.JSON["favorite_path.name"] as? [String]
    }
    
    var textError: String? {
        var error = ""
        if let text = mobile_user_phone?.first {
            error += " " + text
        }
        if let text = mobile_user_new_phone?.first {
            error += " " + text
        }
        if let text = mobile_user_new_email?.first {
            error += " " + text
        }
        
        if let text = favorite_path_data?.first {
            error += " " + text
        }
        
        if let text = favorite_path_name?.first {
            error += " " + text
        }
        return error
    }
}
