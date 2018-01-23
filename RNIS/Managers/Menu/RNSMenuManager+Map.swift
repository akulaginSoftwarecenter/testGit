//
//  RNSMenuManager+Map.swift
//  RNIS
//
//  Created by Артем Кулагин on 18.01.2018.
//  Copyright © 2018 Артем Кулагин. All rights reserved.
//

import Foundation

extension RNSMenuManager {
    
    static var itemMap: MenuItem {
        return shared.itemMap
    }
  
    /// Функция показа карты
    static func showMap() {
        showItem(itemMap)
    }
    
    static func mapToRoot(completion: EmptyBlock? = nil) {
        itemMap.popToRoot(completion: completion)
    }
    
    static func showMapToRoot(completion: EmptyBlock? = nil) {
        showMap()
        mapToRoot(completion: completion)
    }
    
    static func showMapAndSearch() {
        showMapToRoot()
        let vc = RNSSearchViewController.initialController
        let container = STRouter.redContainer(vc)
        itemMap.vc?.push(container)
    }
}
