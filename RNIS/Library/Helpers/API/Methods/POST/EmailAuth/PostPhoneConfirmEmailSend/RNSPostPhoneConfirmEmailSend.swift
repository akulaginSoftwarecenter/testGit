//
//  RNSPostPhoneConfirmEmailSend.swift
//  RNIS
//
//  Created by Артем Кулагин on 17.01.2018.
//  Copyright © 2018 Артем Кулагин. All rights reserved.
//

import UIKit

class RNSPostPhoneConfirmEmailSend: RNSPostConfirmSend {
    override var subject: String {
        return "com.rnis.mobile.action.mobile_user.email.confirm.send"
    }
}
