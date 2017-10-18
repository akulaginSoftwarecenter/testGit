//
//  RNSMoveDetailController+Flag.swift
//  RNIS
//
//  Created by Артем Кулагин on 21.09.17.
//  Copyright © 2017 Артем Кулагин. All rights reserved.
//

import Foundation

/**
 RNSMoveDetailController Flag extention
 */

extension RNSMoveDetailController {
    
    func prepareFlagView() {
        flagView.handlerUpdate = { [weak self] in
            self?.updateFlag()
        }
        updateFlagImage()
    }
    
    func updateFlag() {
        item?.changeFavorite { [weak self] in
            self?.updateFlagImage()
        }
    }
    
    func updateFlagImage() {
        flagView.isFavorite = item?.isFavorite ?? false
    }
}
