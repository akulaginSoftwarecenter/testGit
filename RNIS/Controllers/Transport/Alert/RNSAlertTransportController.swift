//
//  RNSAlertTransportController.swift
//  RNIS
//
//  Created by Артем Кулагин on 05.09.17.
//  Copyright © 2017 Артем Кулагин. All rights reserved.
//

import UIKit

class RNSAlertTransportController: UIAlertController {

    var item: RNSRouteVariant?
    
    static func initController(_ item: RNSRouteVariant?) -> RNSAlertTransportController {
        let vc = RNSAlertTransportController(title: nil, message: nil, preferredStyle: .actionSheet)
        vc.prepareUI()
        vc.item = item
        return vc
    }
    
    func prepareUI() {
        addAction("Переименовать") { //[weak self] in
            //print("Переименовать")
        }
        
        addAction("Удалить",style: .destructive) {[weak self] in
            RNSPageRouteManager.removeItem(self?.item)
        }
        
        addAction("Отмена", style: .cancel)
    }
    
    func addAction(_ title: String?, style: UIAlertActionStyle = .default, complete: EmptyBlock? = nil) {
        addAction(UIAlertAction(title: title, style: style) {action in
            complete?()
        })
    }
}
