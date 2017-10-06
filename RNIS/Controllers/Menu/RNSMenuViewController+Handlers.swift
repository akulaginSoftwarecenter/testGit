//
//  RNSMenuViewController+Transform.swift
//  RNIS
//
//  Created by Артем Кулагин on 01.09.17.
//  Copyright © 2017 Артем Кулагин. All rights reserved.
//

import Foundation

extension RNSMenuViewController {

    func prepareHandlers()  {
        RNSMenuManager.handlerHideLeftMenu = { [weak self] animated in
            self?.hideLeftView(animated: animated)
        }

        RNSMenuManager.handlerShowLeftMenu = { [weak self] in
            self?.showLeftView(animated: true)
        }
        
        RNSMenuManager.handlerShowVC = { [weak self] (vc) in
            self?.showVC(vc)
        }
    }
}
