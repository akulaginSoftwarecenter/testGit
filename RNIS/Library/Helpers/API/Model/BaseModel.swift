//
//  BaseModel.swift
//  Day
//
//  Created by Alexander Kozin on 17.01.16.
//  Copyright © 2016 el-machine. All rights reserved.
//

import Foundation

/**
 Базовая модель для APIModel
 */
class BaseModel: NSObject {
    var id: UInt = 0

    /// Метод инициализации 
    required override init() {
    }
}

/// Методе сравнения базовых моделей
func == (lhs: BaseModel, rhs: BaseModel) -> Bool {
    let equal = lhs.id == rhs.id
    return equal
}
