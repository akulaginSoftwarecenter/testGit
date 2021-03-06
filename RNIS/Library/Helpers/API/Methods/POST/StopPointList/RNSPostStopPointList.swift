//
//  RNSPostStopPointList.swift
//  RNIS
//
//  Created by Артем Кулагин on 08.09.17.
//  Copyright © 2017 Артем Кулагин. All rights reserved.
//

import UIKit
import Alamofire

/**
 Запрос получения списка остановок
 */
class RNSPostStopPointList: RNSRequest {
    override var method: Alamofire.HTTPMethod {
        return .post
    }
    
    typealias AliasReply = RNSRequestReply<RNSItemsPayload,RNSRegisterError>
    typealias AliasComplete = ([String]?) -> ()
    
    var min: PGGeoPoint?
    var center: PGGeoPoint?
    var complete: AliasComplete?
    var failure: AliasStringBlock?
    
    /// Метод инициализации 
    convenience init(_ min: PGGeoPoint, center: PGGeoPoint, complete: AliasComplete?, failure: AliasStringBlock?) {
        self.init()
        
        self.min = min
        self.center = center
        self.complete = complete
        self.failure = failure
        
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
        return ["left": leftTop.latitude,
                "top": leftTop.longitude,
                "right": rightBottom.latitude,
                "bottom": rightBottom.longitude]
    }
    
    override var isShowLogReply: Bool {
        return false
    }
    
    override var isShowLogRequest: Bool {
        return false
    }
  
    func parseReply(_ model: AliasReply?) {
        if  model?.success ?? false,
            let items = model?.payload?.items {
            //print("RNSPostStopPointList",items.count)
            RNSDataManager.parseBusStopItemsAsync(items) { [weak self] (uuids) in
                self?.complete?(uuids)
            }
            return
        }
        parseError(model)
    }
    
    /// Метод расчета ошибки
    func parseError(_ model: AliasReply?) {
        guard let item = model?.errors?.first else {
            return
        }
        let error = "Ошибка загрузки остановок. " + item.textError
        STAlertRouter.showOk(error)
    }
    
    override func showErrorNetwork() {
        failure?(errorNetwork)
    }
    
    override var subject: String {
        return "com.rnis.mobile.action.stop_point.list"
    }
}
