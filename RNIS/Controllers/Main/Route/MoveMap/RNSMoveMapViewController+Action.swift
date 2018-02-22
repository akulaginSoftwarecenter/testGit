//
//  RNSMoveMapViewController+Action.swift
//  RNIS
//
//  Created by Артем Кулагин on 18.01.2018.
//  Copyright © 2018 Артем Кулагин. All rights reserved.
//

import Foundation

/**
 Расширение для работы тапами по кнопкам
 */
extension RNSMoveMapViewController {
    
    @IBAction func actionBack(_ sender: Any) {
        showAlertExit {
            STRouter.pop()
        }
    }
    
    func searchAction() {
        showAlertExit {
            RNSMenuManager.showMapAndSearch()
        }
    }
}
