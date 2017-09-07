//
//  RNSRegisterPayload.swift
//  RNIS
//
//  Created by Артем Кулагин on 07.09.17.
//  Copyright © 2017 Артем Кулагин. All rights reserved.
//

import UIKit
import ObjectMapper

class RNSRegisterPayload: RNISMappableBase {
    
    var is_phone_activated: Int?
    var phone: String?
    var uuid: String?
    var phone_activation_code: String?
    var password: String?
    var name: String?
    var token: String?
    
    public override func mapping(map: Map) {
        is_phone_activated <- map["is_phone_activated"]
        phone <- map["phone"]
        uuid <- map["uuid"]
        phone_activation_code <- map["phone_activation_code"]
        password <- map["password"]
        name <- map["name"]
        token <- map["token"]
    }
    
    func confirmSend() {
        RNSPostConfirmSend(phone)
    }
}
