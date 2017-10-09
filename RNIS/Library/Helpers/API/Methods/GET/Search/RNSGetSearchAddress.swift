//
//  RNSGetSearch.swift
//  RNIS
//
//  Created by Артем Кулагин on 09.10.17.
//  Copyright © 2017 Артем Кулагин. All rights reserved.
//

import UIKit
import Alamofire

class RNSGetSearchAddress: RNSGetGeoCode {
    
    var text: String?
    typealias AliasComplete = (([RNSAddressTemp]?) ->())
    var complete: AliasComplete?
    
    @discardableResult convenience init(_ text: String?, complete: AliasComplete?) {
        self.init()
        
        self.text = text
        self.complete = complete
        sendRequestWithCompletion { (object, error, inot) in
            
        }
    }
    
    override var parameters: [String : Any] {
        guard let text = text else {
            return [:]
        }
        let location = RNSLocationManager.location
        let zoom = RNSMapManager.getZoomLevel
        let latitude = Decimal(location.coordinate.latitude)
        let lat1 = latitude + 0.01 * pow(2, 17 - zoom)
        let lat2 = latitude - 0.01 * pow(2, 17 - zoom)
        let longitude = Decimal(location.coordinate.longitude)
        let lon1 = longitude + 0.01 * pow(2, 17 - zoom)
        let lon2 = longitude - 0.01 * pow(2, 17 - zoom)
        return ["a": "suggest",
                "lat1": lat1,
                "lon1": lon1,
                "lat2": lat2,
                "lon2": lon2,
                "t": "addr",
                "n": 100,
                "beauty": 1,
                "q": text]
    }
    
    override func apiDidReturnReply(_ reply: AnyObject, source: AnyObject){
        guard let dict = reply as? AliasDictionary,
            let res = dict["res"] as? [AliasDictionary] else {
                complete?(nil)
                return
        }
        let items = res.map{ RNSAddressTemp(JSON: $0) }
        complete?(items as? [RNSAddressTemp])
    }
}
