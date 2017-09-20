//
//  RNSPageRoutePopupController+RouteDetail.swift
//  RNIS
//
//  Created by Артем Кулагин on 20.09.17.
//  Copyright © 2017 Артем Кулагин. All rights reserved.
//

import Foundation

extension RNSPageRoutePopupController {
    
    override func prepare(for segue: UIStoryboardSegue, sender: Any?) {
        containerController = segue.destination as? RNSRouteDetailController
        prepareEnterViewController()
    }
    
    func prepareEnterViewController() {
        updateCurrentItem()
    }
    
    func updateCurrentItem() {
        containerController?.item = RNSPageRouteManager.currentItem?.tableItem
        containerController?.handlerBack = { [weak self] in
            self?.handlerDetailBack?()
        }
    }
}
