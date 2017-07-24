//
//  RNSRequestReply.swift
//  RNIS
//
//  Created by Артем Кулагин on 21.07.17.
//  Copyright © 2017 Артем Кулагин. All rights reserved.
//

import UIKit
import ObjectMapper

class RNSRequestReply<T: Mappable>: RNISMappableBase {
    var payload: T?
    
    convenience init?(reply: AnyObject) {
        guard let dict = reply as? AliasDictionary else {
            return nil
        }
        self.init(JSON: dict)
    }
    
    public override func mapping(map: Map) {
        payload <- map["payload"]
    }
}
