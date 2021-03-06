//
//  RNSUserPayload.swift
//  RNIS
//
//  Created by Артем Кулагин on 07.09.17.
//  Copyright © 2017 Артем Кулагин. All rights reserved.
//

import UIKit
import ObjectMapper

/**
 Класс парсера Payload
 */
class RNSUserPayload: RNISMappableBase {
    
    var is_phone_activated: Int?
    var phone: String?
    /// переменная уникальный идентификатор сущности
    var uuid: String?
    var phone_activation_code: String?
    var email_activation_code: String?
    var new_phone_activation_code: String?
    /// переменная имени сущности
    var name: String?
    var token: String?
    var mobile_token: String?
    var avatar: String?
    var email: String?
    var new_phone: String?
    var new_email: String?
    
    var password: String?
    var old_password: String?
    var new_email_activation_code: String?
    var status: String?
    var edit_source: String?
    
    var user: RNSUserPayload?
   
    /// Метод инициализации
    convenience init(phone: String?) {
        self.init()
        
        self.phone = phone
    }
    static func tempToken() -> RNSUserPayload? {
        let item = RNSUserPayload()
        item.status = "temporary"
        return item
    }
    
    /// Метод инициализации 
    convenience init(email: String?) {
        self.init()
        self.email = email
    }
    
    /// Метод парсинга
    public override func mapping(map: Map) {
        is_phone_activated <- map["is_phone_activated"]
        phone <- map["phone"]
        uuid <- map["uuid"]
        phone_activation_code <- map["phone_activation_code"]
        new_phone_activation_code <- map["new_phone_activation_code"]
        name <- map["name"]
        token <- map["token"]
        user <- map["user"]
        mobile_token <- map["mobile_token"]
        avatar <- map["avatar"]
        email <- map["email"]
        new_phone <- map["new_phone"]
        new_email <- map["new_email"]
                 
        password <- map["password"]
        old_password <- map["old_password"]
        email_activation_code <- map["email_activation_code"]
        new_email_activation_code <- map["new_email_activation_code"]
        status <- map["status"]
        edit_source <- map["edit_source"]
    }
    
    func prepareProfile() {
        edit_source = "profile"
    }
    
    static func itemUserDefault() -> RNSUserPayload {
        let item = RNSUserPayload()
        item.mobile_token = UserDefaults.token
        item.uuid = UserDefaults.uuid
        item.phone = UserDefaults.login
        return item
    }
    
    var formatPhone: String? {
        guard let phone = phone else {
            return nil
        }
        return InputFieldsValidator.format(phone).text
    }
    
    
    func loadImage(complete: ((UIImage?)->())?) {
        guard let avatar = avatar else {
            return
        }
        DispatchQueue.global(qos: .userInitiated).async {
            var image: UIImage?
            if let imageData = NSData(base64Encoded: avatar, options: .ignoreUnknownCharacters) as Data? {
                image = UIImage(data: imageData)
            }
            Utils.mainQueue {
                complete?(image)
            }
        }
    }
}
