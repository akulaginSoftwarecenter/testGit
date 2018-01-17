//
//  RNSUserPayload+PhoneAuth.swift
//  RNIS
//
//  Created by Артем Кулагин on 17.01.2018.
//  Copyright © 2018 Артем Кулагин. All rights reserved.
//

import Foundation

extension RNSUserPayload {
    
    func confirmSend() {
        RNSPostConfirmSend(self, complete: { item in
            STAlertRouter.showRepeatCode()
        }, failure: {
            STAlertRouter.showOk($0)
        })
    }
    
    func phoneConfirmSend() {
        RNSPostPhoneConfirmSend(self, complete: { item in
            STAlertRouter.showRepeatCode()
        }, failure: {
            STAlertRouter.showOk($0)
        })
    }
}
