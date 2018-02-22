//
//  RNSLoginError.swift
//  RNIS
//
//  Created by Артем Кулагин on 24.08.17.
//  Copyright © 2017 Артем Кулагин. All rights reserved.
//

import UIKit
import ObjectMapper

/**
 Класс ошибки
 */
class RNSLoginError: RNISMappableBase {
    var login: [String]?
    var password: [String]?
    
    /// Метод парсинга
    public override func mapping(map: Map) {
        login <- map["login"]
        password <- map["password"]
    }
    
    var textError: String {
        var text = ""
        if let login = login?.first {
            text += " " + login
        }
        
        if let password = password?.first {
            text += ", " + password
        }
        return text
    }
}
