//
//  RNSTempRegister.swift
//  RNIS
//
//  Created by Артем Кулагин on 24.01.2018.
//  Copyright © 2018 Артем Кулагин. All rights reserved.
//

import UIKit

class RNSTempRegister: RNSRequest {
    
    override var payload: AliasDictionary {
        return ["is_temporary": true]
    }
    
    override var headers: AliasDictionary {
        var dict = super.headers
        dict[kMeta] = AliasDictionary()
        return dict
    }
    
    override var subject: String {
        return subjectRegister
    }
}
