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
    var name: String?
    var token: String?
    
    var password: String?
    var old_password: String?
   
    convenience init(phone: String?) {
        self.init()
        
        self.phone = phone
    }
    
    public override func mapping(map: Map) {
        is_phone_activated <- map["is_phone_activated"]
        phone <- map["phone"]
        uuid <- map["uuid"]
        phone_activation_code <- map["phone_activation_code"]
        name <- map["name"]
        token <- map["token"]
        
        password <- map["password"]
        old_password <- map["old_password"]
    }
    
    func confirmSend() {
        RNSPostConfirmSend(self, complete: { item in
            STRouter.showAlertRepeatCode()
        }, failure: {
            STRouter.showAlertOk($0)
        })
    }
    
    static func itemUserDefault() -> RNSRegisterPayload {
        let item = RNSRegisterPayload()
        item.token = UserDefaults.token
        item.uuid = UserDefaults.uuid
        item.password = UserDefaults.password
        item.old_password = UserDefaults.password
        return item
    }
}
