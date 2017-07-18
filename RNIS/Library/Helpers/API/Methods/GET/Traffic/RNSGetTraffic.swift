//
//  RNSGetTraffic.swift
//  RNIS
//
//  Created by Артем Кулагин on 18.07.17.
//  Copyright © 2017 Артем Кулагин. All rights reserved.
//

import UIKit

class RNSGetTraffic: AlamofireAPI {
    
    var minCoord: PGGeoPoint?
    var maxCoord: PGGeoPoint?
    var zoom: Int?
    
    convenience init(minCoord: PGGeoPoint?, maxCoord: PGGeoPoint?, zoom: Int?) {
        self.init()
        
        self.minCoord = minCoord
        self.maxCoord = maxCoord
        self.zoom = zoom
    }
    
    override var path: String {
        return "http://traffic.tmcrussia.com/"
    }
    
    override var parameters: [String : AnyObject] {
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
  
        /*
        var dict = object as! [String : AnyObject]
        if !SLTGraphManager.visibleTitleAll {
            if let clid = SLTLineManager.clid {
                dict["clid"] = clid
            }
        }
        return super.parameters + dict
 */
        return [:]
    }
    


}
