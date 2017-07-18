//
//  BaseModel.swift
//  Day
//
//  Created by Alexander Kozin on 17.01.16.
//  Copyright © 2016 el-machine. All rights reserved.
//

import Foundation

class BaseModel: NSObject {
    var id: UInt = 0

    required override init() {
    }
}

func == (lhs: BaseModel, rhs: BaseModel) -> Bool {
    let equal = lhs.id == rhs.id
    return equal
}
