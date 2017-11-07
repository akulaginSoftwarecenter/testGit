//
//  RNSPostUserGet.swift
//  RNIS
//
//  Created by Артем Кулагин on 19.09.17.
//  Copyright © 2017 Артем Кулагин. All rights reserved.
//

import UIKit
import Alamofire

class RNSPostUserGet: RNSPostRequestMobileToken {
    
    override var isShowLogReply: Bool {
        return true
    }

    typealias AliasReply = RNSRequestReply<RNSItemsPayload,RNSRegisterError>
    
    override func apiDidReturnReply(_ reply: AnyObject, source: AnyObject){
        parseReply(AliasPostRegister(reply: reply), source: source)
    }
    
    func parseReply(_ model: AliasPostRegister?, source: AnyObject) {
        if  model?.success ?? false {
            super.apiDidReturnReply(model?.payload as AnyObject, source: source)
             return
        }
        parseError(model, source: source)
    }
    
    func parseError(_ model: AliasPostRegister?, source: AnyObject) {
        guard let item = model?.errors?.first else {
            return
        }
        super.apiDidFailWithError(item.error)
    }
    
    override var subject: String {
        return "com.rnis.mobile.action.mobile_user.get"
    }
}
