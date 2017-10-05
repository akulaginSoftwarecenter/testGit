//
//  RNSPostBusList.swift
//  RNIS
//
//  Created by Артем Кулагин on 26.09.17.
//  Copyright © 2017 Артем Кулагин. All rights reserved.
//

import UIKit
import Alamofire

class RNSPostBusList: RNSRequest {
    override var method: Alamofire.HTTPMethod {
        return .post
    }
    
    typealias AliasReply = RNSRequestReply<RNSItemsPayload,RNSRegisterError>
    typealias AliasComplete = ([String]?) -> ()
    
    var min: PGGeoPoint?
    var center: PGGeoPoint?
    var complete: AliasComplete?
    
    convenience init(_ min: PGGeoPoint, center: PGGeoPoint, complete: AliasComplete?) {
        self.init()
        
        self.min = min
        self.center = center
        self.complete = complete
        
        sendRequestWithCompletion {[weak self] (object, error, inot) in
            self?.parseReply(AliasReply(reply: object))
        }
    }
    
    override var payload: AliasDictionary {
        guard let center = center,
            let distance = min?.distanceTo(center),
            let leftTop = center.coordinate(45, distance: distance),
            let rightBottom = center.coordinate(225, distance: distance) else {
                return super.payload
        }
        
        let bounding_box = ["left": leftTop.latitude,
                            "top": leftTop.longitude,
                            "right": rightBottom.latitude,
                            "bottom": rightBottom.longitude]
        return ["bounding_box": bounding_box,
                "last_update": "9999999999"
            ]
    }
    
    override var isShowLogReply: Bool {
        return false
    }
    
    func parseReply(_ model: AliasReply?) {
        if  model?.success ?? false,
            let items = model?.payload?.items {
            //print("RNSPostBusList",items.count)
            RNSDataManager.parseBusItemsAsync(items) { [weak self] (uuids) in
                self?.complete?(uuids)
            }
            return
        }
        parseError(model)
    }
    
    func parseError(_ model: AliasReply?) {
        guard let item = model?.errors?.first else {
            return
        }
        let error = "Ошибка загрузки автобусов. " + item.textError
        STRouter.showAlertOk(error)
    }
    
    override var subject: String {
        return "com.rnis.mobile.action.bus.list"
    }
}
