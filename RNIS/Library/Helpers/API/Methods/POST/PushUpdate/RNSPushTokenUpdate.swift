//
//  RNSPushTokenUpdate.swift
//  RNIS
//
//  Created by Артем Кулагин on 05.02.2018.
//  Copyright © 2018 Артем Кулагин. All rights reserved.
//

import UIKit

/**
 Запрос отправки пуш токена
*/
class RNSPushTokenUpdate: RNSPostRequestMobileToken {
    override var payload: AliasDictionary {
        guard let token = UserDefaults.pushToken else {
            return [:]
        }
        return ["push_token_ios": token]
    }
    
    override var subject: String {
        return "com.rnis.mobile.action.mobile_user.push_token.update"
    }
}
