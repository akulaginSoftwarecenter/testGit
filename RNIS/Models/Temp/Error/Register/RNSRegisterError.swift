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
    var mobile_user_name: [String]?
    var mobile_user_phone: [String]?
    var mobile_user_new_phone: [String]?
    var mobile_user_new_email: [String]?
    
    var favorite_path_data: [String]?
    var favorite_path_name: [String]?
    var mobile_user_email: [String]?
    var mobile_user_edit_source: [String]?
    
    public override func mapping(map: Map) {
        
        mobile_user_phone <- map["mobile_user.phone"]
        mobile_user_phone = map.JSON["mobile_user.phone"] as? [String]
        
        mobile_user_new_phone = map.JSON["mobile_user.new_phone"] as? [String]
        mobile_user_new_email = map.JSON["mobile_user.new_email"] as? [String]
        
        favorite_path_data = map.JSON["favorite_path.data"] as? [String]
        favorite_path_name = map.JSON["favorite_path.name"] as? [String]
        mobile_user_name = map.JSON["mobile_user.name"] as? [String]
        mobile_user_email = map.JSON["mobile_user.email"] as? [String]
        mobile_user_edit_source = map.JSON["mobile_user.edit_source"] as? [String]
    }
    
    var textError: String? {
        var error = ""
        let items = [mobile_user_phone,
                     mobile_user_new_phone,
                     mobile_user_new_email,
                     favorite_path_data,
                     favorite_path_name,
                     mobile_user_name,
                     mobile_user_email,
                     mobile_user_edit_source]
        items.forEach {
            guard let text = $0?.first else {
                return
            }
            if !error.isEmpty {
                error += ", "
            }
            error += text
        }
        return error
    }
}
