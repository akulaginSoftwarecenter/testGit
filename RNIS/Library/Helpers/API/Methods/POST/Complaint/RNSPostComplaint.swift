//
//  RNSPostComplaint.swift
//  RNIS
//
//  Created by Артем Кулагин on 08.09.17.
//  Copyright © 2017 Артем Кулагин. All rights reserved.
//

import UIKit
import Alamofire

class RNSPostComplaint: RNSRequest {
    override var method: Alamofire.HTTPMethod {
        return .post
    }
    
    var complete: AliasComplete?
    var text: String?
    
    
    typealias AliasPayload = RNSFeedbackPayload
    typealias AliasReply = RNSRequestReply<AliasPayload,RNSRegisterError>
    typealias AliasComplete = (AliasPayload?) -> ()
    
    @discardableResult convenience init(_ text: String?, complete: AliasComplete?) {
        self.init()
        
        self.text = text
        self.complete = complete
        
        STRouter.showLoader()
        sendRequestWithCompletion {[weak self] (object, error, inot) in
            STRouter.removeLoader()
            self?.parseReply(AliasReply(reply: object))
        }
    }
    
    func parseReply(_ model: AliasReply?) {
        if  model?.success ?? false {
            complete?(model?.payload)
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
        guard let text = text else {
            return [:]
        }
        return ["body": text]
    }
    
    override var subject: String {
        return "com.rnis.mobile.action.complaint.send"
    }
}
