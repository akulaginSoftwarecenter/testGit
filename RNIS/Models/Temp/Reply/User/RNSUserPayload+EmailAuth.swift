//
//  RNSUserPayload+EmailAuth.swift
//  RNIS
//
//  Created by Артем Кулагин on 17.01.2018.
//  Copyright © 2018 Артем Кулагин. All rights reserved.
//

import Foundation

extension RNSUserPayload {
    func confirmEmailSend() {
        RNSEmailConfirmResend(self, complete: { item in
            STAlertRouter.showRepeatCode()
        }, failure: {
            STAlertRouter.showOk($0)
        })
    }
    
    func phoneConfirmEmailSend() {
        RNSPostPhoneConfirmEmailSend(self, complete: { item in
            STAlertRouter.showRepeatCode()
        }, failure: {
            STAlertRouter.showOk($0)
        })
    }
}
