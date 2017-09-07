//
//  RNSPostUpdate.swift
//  RNIS
//
//  Created by Артем Кулагин on 07.09.17.
//  Copyright © 2017 Артем Кулагин. All rights reserved.
//

import UIKit
import Alamofire

class RNSPostUpdate: RNSRequest {
    override var method: Alamofire.HTTPMethod {
        return .post
    }
    
    var item: RNSRegisterPayload?
    var failure: AliasStringBlock?
    
    typealias AliasPostRegister = RNSRequestReply<RNSRegisterPayload,RNSRegisterError>
    
    @discardableResult convenience init(_ item: RNSRegisterPayload?, failure: AliasStringBlock?) {
        self.init()
        
        self.item = item
        self.failure = failure
        STRouter.showLoader()
        sendRequestWithCompletion {[weak self] (object, error, inot) in
            STRouter.removeLoader()
            self?.parseReply(AliasPostRegister(reply: object))
        }
    }
    
    func parseReply(_ model: AliasPostRegister?) {
        if  model?.success ?? false {
            print("parseReply success")
                    //STRouter.pushAnimatedImageBoard(RNSRegistrationNameController.initialController)
            return
        }
        parseError(model)
    }
    
    func parseError(_ model: AliasPostRegister?) {
        guard let error = model?.errors?.first?.textError else {
            return
        }
        failure?(error)
    }
    
    override var payload: AliasDictionary {
        guard let item = item else {
            return [:]
        }

        return item.toJSON()
    }
    
    override var subject: String {
        return "com.rnis.mobile.action.mobile_user.update"
    }
}
