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
    
    override var path: String {
        return mapHost3 + "search/"
    }
    
    var text: String?
    typealias AliasComplete = (([RNSAddressTemp]?) ->())
    var complete: AliasComplete?
    var failure: AliasStringBlock?
    
    /// Метод инициализации 
    @discardableResult convenience init(_ text: String?, complete: AliasComplete?, failure: AliasStringBlock?) {
        self.init()
        
        self.text = text
        self.complete = complete
        self.failure = failure
        sendRequestWithCompletion { (object, error, inot) in
            
        }
    }
    
    override var parameters: [String : Any] {
        let point = RNSLocationManager.point
        let distance = Double(10000)
        guard let text = text,
            let location1 = point.coordinate(135, distance: distance),
            let location2 = point.coordinate(315, distance: distance) else {
            return [:]
        }
        return ["a": "suggest",
                "lat1": location1.latitude,
                "lon1": location1.longitude,
                "lat2": location2.latitude,
                "lon2": location2.longitude,
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
        DispatchQueue.global(qos: .background).async {
            var items = res.map{ RNSAddressTemp(JSON: $0) }
            items = items.sorted { (item1, item2) -> Bool in
                let dist1 = item1?.distanceToCurrent ?? 10000000
                let dist2 = item2?.distanceToCurrent ?? 10000000
                return dist1 < dist2
            }
            Utils.mainQueue {
                self.complete?(items as? [RNSAddressTemp])
            }
        }
    }
    
    override func showErrorNetwork() {
        failure?(errorNetwork)
    }
}
