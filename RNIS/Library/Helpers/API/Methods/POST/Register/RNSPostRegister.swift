//
//  RNSPostRegister.swift
//  RNIS
//
//  Created by Артем Кулагин on 07.09.17.
//  Copyright © 2017 Артем Кулагин. All rights reserved.
//

import UIKit

class RNSPostRegister: RNSParentAuthPost {
    
    override func parseReply(_ model: AliasPostRegister?) {
        if let payload = model?.payload?.user, payload.uuid != nil  {
            self.complete?(payload)
            return
        }
        parseError(model)
    }
    
    override var subject: String {
        return subjectRegister
    }
}
