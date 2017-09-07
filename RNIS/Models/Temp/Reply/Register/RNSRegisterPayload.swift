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
    
    public override func mapping(map: Map) {
        is_phone_activated <- map["is_phone_activated"]
        phone <- map["phone"]
        uuid <- map["uuid"]
    }
    
    func confirmSend() {
        RNSPostConfirmSend(phone)
    }
}
