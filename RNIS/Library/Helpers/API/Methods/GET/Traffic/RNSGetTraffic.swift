//
//  RNSGetTraffic.swift
//  RNIS
//
//  Created by Артем Кулагин on 18.07.17.
//  Copyright © 2017 Артем Кулагин. All rights reserved.
//

import UIKit
import ObjectMapper

class RNSGetTraffic: AlamofireAPI {
    
    var minCoord: PGGeoPoint?
    var maxCoord: PGGeoPoint?
    var zoom: Int32?
    
    @discardableResult convenience init(minCoord: PGGeoPoint?, maxCoord: PGGeoPoint?, zoom: Int32?, completion: @escaping APICompletion) {
        self.init()
        
        self.minCoord = minCoord
        self.maxCoord = maxCoord
        self.zoom = zoom
        sendRequestWithCompletion(completion: completion)
    }
    
    override var path: String {
        return "http://traffic.tmcrussia.com/"
    }
    
    override var parameters: [String : Any] {
        guard let minCoord = minCoord,
            let maxCoord = maxCoord,
            let zoom = zoom else {
            return super.parameters
        }
        let dict: [String : Any] = ["lon1": minCoord.longitude,
                    "lat1": minCoord.latitude,
                    "lon2": maxCoord.longitude,
                    "lat2": maxCoord.latitude,
                    "z": zoom]
        return dict
    }
    
    @objc override func apiDidReturnReply(_ reply: AnyObject, source: AnyObject){
        guard let dict = reply as? AliasDictionary,
            let model = RNSTrafficData(JSON: dict) else {
            superError()
            return
        }
        super.apiDidReturnReply(model.averageMarks as AnyObject, source: source)
    }
    
    override func superError() {
        super.apiDidFailWithError(NSError(domain: "Не удалось получить полную информацию о трафике в данном регионе.", code: 0, userInfo: [:]))
    }
}
