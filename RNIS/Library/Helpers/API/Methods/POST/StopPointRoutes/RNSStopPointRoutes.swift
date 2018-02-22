//
//  RNSStopPointRoutes.swift
//  RNIS
//
//  Created by Артем Кулагин on 18.09.17.
//  Copyright © 2017 Артем Кулагин. All rights reserved.
//

import UIKit
import Alamofire

class RNSStopPointRoutes: RNSPostRequestMobileToken {
    override var method: Alamofire.HTTPMethod {
        return .post
    }
    
    override var isShowLogReply: Bool {
        return true
    }
    
    var complete: AliasComplete?
    var failure: AliasStringBlock?
    var item: RNSBusStop?
    
    
    typealias AliasReply = RNSRequestReply<RNSStopPointRoutesPayload,RNSRegisterError>
    typealias AliasComplete = ([RNSBusRouteTemp]?) -> ()
    
    /// Метод инициализации 
    @discardableResult convenience init(_ item: RNSBusStop?, complete: AliasComplete?, failure: AliasStringBlock?) {
        self.init()
        
        self.item = item
        self.complete = complete
        self.failure = failure
        
        sendRequestWithCompletion {[weak self] (object, error, inot) in
            self?.parseReply(AliasReply(reply: object))
        }
    }
    
    func parseReply(_ model: AliasReply?) {
        if  model?.success ?? false {
            complete?(model?.payload?.items)
            return
        }
        parseError(model)
    }
    
    /// Метод расчета ошибки
    func parseError(_ model: AliasReply?) {
        guard let error = model?.errors?.first?.textError else {
            return
        }
        failure?(error)
    }
    
    override var payload: AliasDictionary {
        guard let uuid = item?.uuid else {
                return [:]
        }
        return ["uuid": uuid]
    }
    
    override func apiDidFailWithError(_ error: NSError) {
        failure?(nil)
    }
    
    override var subject: String {
        return "com.rnis.mobile.action.stop_point.routes"
    }
}
