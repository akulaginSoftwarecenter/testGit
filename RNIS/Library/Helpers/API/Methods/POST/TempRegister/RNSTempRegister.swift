//
//  RNSTempRegister.swift
//  RNIS
//
//  Created by Артем Кулагин on 24.01.2018.
//  Copyright © 2018 Артем Кулагин. All rights reserved.
//

import UIKit
import Alamofire

/**
 Запрос регистрации
 */
class RNSTempRegister: RNSParentAuthPost {
    
    /// Метод инициализации 
    @discardableResult convenience init(complete: AliasRegisterPayloadBlock?, failure: AliasStringBlock? = nil) {
        self.init(RNSUserPayload.tempToken(), complete: complete, isNeedLoaders: false, failure: failure)
    }

    override var subject: String {
        return subjectRegister
    }
}
