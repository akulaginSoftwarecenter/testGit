//
//  PostPhoneConfirmEmailCheck.swift
//  RNIS
//
//  Created by Артем Кулагин on 17.01.2018.
//  Copyright © 2018 Артем Кулагин. All rights reserved.
//

import UIKit

/**
 Запрос подтверждения почты
 */
class PostEmailConfirmCheck: RNSPostConfirmCheck {
    override var headers: AliasDictionary {
        return super.headers.merged(with: Utils.mobileToken)
    }
    
    override var subject: String {
        return "com.rnis.mobile.action.mobile_user.new_email.confirm.check"
    }
}
