//
//  RNSPostBusGet.swift
//  RNIS
//
//  Created by Артем Кулагин on 04.10.17.
//  Copyright © 2017 Артем Кулагин. All rights reserved.
//

import UIKit
import Alamofire

class RNSPostBusGet: RNSRequest {
    var item: RNSBus?
    var complete: EmptyBlock?
    
    override var method: Alamofire.HTTPMethod {
        return .post
    }
    
    typealias AliasReply = RNSRequestReply<RNISMappableBase,RNSRegisterError>
    
    @discardableResult convenience init(_ item: RNSBus?, complete: EmptyBlock?) {
        self.init()
        
        self.item = item
        self.complete = complete
        
        sendRequestWithCompletion {[weak self] (object, error, inot) in
            complete?()
            self?.parseReply(AliasReply(reply: object))
        }
    }
    
    func parseReply(_ model: AliasReply?) {
        if  model?.success ?? false {
            return
        }
        parseError(model)
    }
    
    func parseError(_ model: AliasReply?) {
        guard let error = model?.errors?.first?.textError else {
            return
        }
        STRouter.showAlertOk(error)
    }
    
    override var payload: AliasDictionary {
        guard let uuid = item?.uuid else {
            return [:]
        }
        return [kUuid: uuid]
    }
    
    override var subject: String {
        return "com.rnis.mobile.action.bus.get"
    }
}
