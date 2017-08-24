//
//  RNSRequestError.swift
//  RNIS
//
//  Created by Артем Кулагин on 24.08.17.
//  Copyright © 2017 Артем Кулагин. All rights reserved.
//

import UIKit
import ObjectMapper

class RNSRequestError<T: Mappable>: RNISMappableBase {
    var data: T?
    var text: String?
    
    convenience init?(reply: AnyObject?) {
        guard let dict = reply as? AliasDictionary else {
            return nil
        }
        self.init(JSON: dict)
    }
    
    public override func mapping(map: Map) {
        data <- map["data"]
        text <- map["text"]
    }
}
