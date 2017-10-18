//
//  RNSMovePopupController+Container.swift
//  RNIS
//
//  Created by Артем Кулагин on 21.09.17.
//  Copyright © 2017 Артем Кулагин. All rights reserved.
//

import Foundation

/**
 RNSMovePopupController Container extention
 */

extension RNSMovePopupController {
    
    override func prepare(for segue: UIStoryboardSegue, sender: Any?) {
        containerController = segue.destination as? RNSMoveDetailController
        prepareEnterViewController()
    }
    
    func prepareEnterViewController() {
        containerController?.item = item
        containerController?.handlerBack = { [weak self] in
            self?.handlerDetailBack?()
        }
    }
}
