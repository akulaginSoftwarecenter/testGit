//
//  RNSPostConfirmCheck.swift
//  RNIS
//
//  Created by Артем Кулагин on 07.09.17.
//  Copyright © 2017 Артем Кулагин. All rights reserved.
//

import UIKit

/**
 Запрос проверки телефона
 */
class RNSPostConfirmCheck: RNSParentAuthPost {
    
    override func parseReply(_ model: AliasPostRegister?) {
        if  model?.success ?? false,
            let payload = model?.payload {
            complete?(payload)
            return
        }
        parseError(model)
    }
    
    override var subject: String {
        return "com.rnis.mobile.action.mobile_user.confirm.check"
    }
}
