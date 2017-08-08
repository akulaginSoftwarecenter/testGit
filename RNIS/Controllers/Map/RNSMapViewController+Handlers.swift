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
        
        RNSMapManager.handlerAddOverlay = { [weak self] (item) in
            self?.addOverlay(item)
        }
        
        RNSMapManager.handlerRemoveOverlay = { [weak self] (item) in
            self?.removeOverlay(item)
        }
        
        RNSMapManager.handlerAddRoute = { [weak self] (item) in
            self?.addRoute(item)
        }
        
        RNSMapManager.handlerDismissOldPresentVC = { [weak self] in
            self?.dismissOldPresentVC()
        }
    }
}
