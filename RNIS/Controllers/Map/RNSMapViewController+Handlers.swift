//
//  RNSMapViewController+Handlers.swift
//  RNIS
//
//  Created by Артем Кулагин on 21.07.17.
//  Copyright © 2017 Артем Кулагин. All rights reserved.
//

import Foundation

extension RNSMapViewController {
    
    func prepareHandlers() {
        
        RNSMapManager.handlerAddRoute = { [weak self] item in
            self?.addRoute(item)
        }
        
        RNSMapManager.handlerDismissOldPresentVC = { [weak self] in
            self?.dismissOldPresentVC()
        }
        
        RNSMapManager.handlerShowInfo = { [weak self] item in
            self?.showInfoIfNeed(item)
        }
    }
}
