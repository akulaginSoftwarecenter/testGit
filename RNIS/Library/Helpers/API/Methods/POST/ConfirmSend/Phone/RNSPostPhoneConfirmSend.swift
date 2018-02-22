//
//  RNSPostPhoneConfirmSend.swift
//  RNIS
//
//  Created by Артем Кулагин on 22.09.17.
//  Copyright © 2017 Артем Кулагин. All rights reserved.
//

import UIKit

/**
 Запрос подтверждения телефона
 */
class RNSPostPhoneConfirmSend: RNSPostConfirmSend {
    override var subject: String {
        return "com.rnis.mobile.action.mobile_user.phone.confirm.send"
    }
}
