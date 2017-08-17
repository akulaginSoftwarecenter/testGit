//
//  RNSGetGeoCode.swift
//  RNIS
//
//  Created by Артем Кулагин on 17.08.17.
//  Copyright © 2017 Артем Кулагин. All rights reserved.
//

import UIKit

class RNSGetGeoCode: AlamofireAPI {
    
    var point: PGGeoPoint?
    
    @discardableResult convenience init(point: PGGeoPoint?, complete: AliasStringBlock?) {
        self.init()
        
        self.point = point
        sendRequestWithCompletion { (object, error, inot) in
            complete?(object as? String)
        }
    }
    
    override var path: String {
        return "http://95.213.205.92/search/"
    }
    
    override var parameters: [String : Any] {
        guard let point = point else {
                return super.parameters
        }
        return ["a": "geocode",
                "lat": point.latitude,
                "lon": point.longitude,
                "is_addr": 1,
                "n": 1]
    }
    
    override func apiDidReturnReply(_ reply: AnyObject, source: AnyObject){
        guard let dict = reply as? AliasDictionary,
            let res = dict["res"] as? [AliasDictionary],
            let addr =  res.first?["addr"] as? String else {
                superError()
                return
        }
        super.apiDidReturnReply(addr as AnyObject, source: source)
    }
    
    override func superError() {
        super.apiDidFailWithError(NSError(domain: "Не удалось получить информацию о адресе", code: 0, userInfo: [:]))
    }
}
