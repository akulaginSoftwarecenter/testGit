//
//  RNSEmailConfirmCheck.swift
//  RNIS
//
//  Created by Артем Кулагин on 17.01.2018.
//  Copyright © 2018 Артем Кулагин. All rights reserved.
//

import UIKit

/**
 Запрос подтверждения почты
 */
class RNSEmailConfirmCheck: RNSParentAuthPost {
    override func parseReply(_ model: AliasPostRegister?) {
        if  model?.success ?? false,
            let payload = model?.payload {
            complete?(payload)
            return
        }
        parseError(model)
    }
    
    override var subject: String {
        return "com.rnis.mobile.action.mobile_user.email.confirm.check"
    }
}
