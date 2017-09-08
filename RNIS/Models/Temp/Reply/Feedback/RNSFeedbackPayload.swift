//
//  RNSFeedbackPayload.swift
//  RNIS
//
//  Created by Артем Кулагин on 08.09.17.
//  Copyright © 2017 Артем Кулагин. All rights reserved.
//

import UIKit
import ObjectMapper

class RNSFeedbackPayload: RNISMappableBase {
    
    var name: String?
    var contact: String?
    var body: String?
    
    convenience init(_ name: String?, contact: String?, body: String?) {
        self.init()
        
        self.name = name
        self.contact = contact
        self.body = body
    }
    
    public override func mapping(map: Map) {
        name <- map["name"]
        contact <- map["contact"]
        body <- map["body"]
    }
}
