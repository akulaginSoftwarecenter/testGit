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
    
    var textError: String {
        var textError = ""
        
        if let text = self.text {
            textError += text
        }
        
        if let data = data as? RNSTextErrorProtocol,
            let error = data.textError  {
            textError += "," + error
        }
        return textError
    }
    
    var error: NSError  {
       return NSError(domain: textError, code: 0, userInfo: [:])
    }
}
