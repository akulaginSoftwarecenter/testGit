//
//  RNSRouteVariant.swift
//  RNIS
//
//  Created by Артем Кулагин on 21.08.17.
//  Copyright © 2017 Артем Кулагин. All rights reserved.
//

import UIKit
import ObjectMapper

class RNSRouteVariant: RNISMappableBase {
    
    var points: [RNSRoutePoint]?
    var dict: AliasDictionary?
    
    public override func mapping(map: Map) {
        points <- map["points"]
        dict = map.JSON
        prepareHashValue()
        prepareCenterPoint()
        prepareEndDate()
        setupNavels()
        prepareTitleWidthBuss()
    }
    
    var hashValue: Int = 0
    var time: Int?
    var isFavorite: Bool = false
    var roadActivate: [PGPolyline]?
    var roadOff: RNSRoadOff?
    var currentZoom: Int?
    var endDate: Date?
    var title: String?
    var centerPoint: PGGeoPoint?
    var titleWidthBuss: CGFloat?
    var navels: [RNSDurationItem]?
    
    var endPoint: RNSRoutePoint? {
        return points?.last
    }
    
    func removeAllRoad() {
        removeRoadOff()
        removeRoadActivate()
    }
    
    lazy var dotsVerticalModel: RNSDotsVerticalModel = {
        return RNSDotsVerticalModel(self)
    }()
   
    func changeFavorite(complete: EmptyBlock?) {
        //isFavorite = !isFavorite
        RNSPostFavoritePathCreate(self) {
            
        }
        Utils.delay(1, closure: complete)
    }
}
