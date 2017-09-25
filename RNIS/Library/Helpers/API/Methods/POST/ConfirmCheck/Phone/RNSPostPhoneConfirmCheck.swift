//
//  RNSPostPhoneConfirmCheck.swift
//  RNIS
//
//  Created by Артем Кулагин on 22.09.17.
//  Copyright © 2017 Артем Кулагин. All rights reserved.
//

import UIKit

class RNSPostPhoneConfirmCheck: RNSPostConfirmCheck {
    
    override var headers: AliasDictionary {
        return super.headers.merged(with: Utils.mobileToken)
    }
    
    override var subject: String {
        return "com.rnis.mobile.action.mobile_user.phone.confirm.check"
    }
}
