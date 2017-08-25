//
//  Array+Utils.swift
//  Spytricks
//
//  Created by Артем Кулагин on 15.06.17.
//  Copyright © 2017 Ivan Alekseev. All rights reserved.
//

import Foundation

extension Array where Element: Hashable {
    
    func valueAt(_ index: Int?) -> Element? {
        guard let index = index, index < count  else {
            return nil
        }
        return self[index]
    }
    
    func value<T>(_ index: Int?) -> T? {
        guard let index = index, index < count  else {
            return nil
        }
        return self[index] as? T
    }
}
