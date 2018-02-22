//
//  RNSPostConfirmSend.swift
//  RNIS
//
//  Created by Артем Кулагин on 07.09.17.
//  Copyright © 2017 Артем Кулагин. All rights reserved.
//

import UIKit
/**
 Запрос подтверждения телефона
 */
class RNSPostConfirmSend: RNSParentAuthPost {
    
    override func parseReply(_ model: AliasPostRegister?) {
        if  model?.success ?? false {
            complete?(item)
            return
        }
        parseError(model)
    }
    
    override var subject: String {
        return "com.rnis.mobile.action.mobile_user.confirm.send"
    }
}
