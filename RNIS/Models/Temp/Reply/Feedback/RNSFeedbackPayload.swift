//
//  RNSFeedbackPayload.swift
//  RNIS
//
//  Created by Артем Кулагин on 08.09.17.
//  Copyright © 2017 Артем Кулагин. All rights reserved.
//

import UIKit
import ObjectMapper

/**
 Класс парсера Payload
 */
class RNSFeedbackPayload: RNISMappableBase {
    
    var contact: String?
    var body: String?
    
    /// Метод инициализации 
    convenience init(_ contact: String?, body: String?) {
        self.init()
        
        self.contact = contact
        self.body = body
    }
    
    public override func mapping(map: Map) {
        contact <- map["contact"]
        body <- map["body"]
    }
}
