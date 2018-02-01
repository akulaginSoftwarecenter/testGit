//
//  RNSMapParentController+Handlers.swift
//  RNIS
//
//  Created by Артем Кулагин on 01.02.2018.
//  Copyright © 2018 Артем Кулагин. All rights reserved.
//

import Foundation

extension RNSMapParentController {
    
    func prepareHandlers() {
        RNSMapManager.handlerUpdateLoader = { [weak self] in
            self?.updateLoader()
        }
        
        RNSMapManager.handlerItemsUpdate = { [weak self] in
            self?.itemsUpdate()
        }
    }
}
