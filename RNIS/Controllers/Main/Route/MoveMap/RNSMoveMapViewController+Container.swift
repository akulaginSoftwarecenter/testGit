//
//  RNSMoveMapViewController+Container.swift
//  RNIS
//
//  Created by Артем Кулагин on 18.01.2018.
//  Copyright © 2018 Артем Кулагин. All rights reserved.
//

import Foundation

/**
 Расширение для контейнера
 */
extension RNSMoveMapViewController {
    /// Функция подготовки контейнера
    override func prepare(for segue: UIStoryboardSegue, sender: Any?) {
        let containerController = segue.destination as? RNSMapParentController
        containerController?.bottomTargetConstant = 91
        containerController?.handlerOnMapLongTouchEvent = {[weak self] point in
            self?.onMapLongTouchEvent(point)
        }
        
        containerController?.handlerOnMapTouchEvent = {[weak self] point in
            self?.onMapTouchEvent(point)
        }
        
        containerController?.handlerOnMapEvent = {[weak self] in
            self?.onMapEvent()
        }
        prepareSearchButton(containerController)
    }
    
    func prepareSearchButton(_ containerController: RNSMapParentController?) {
        containerController?.searchRemoveTarget = true
        containerController?.handlerSearch = { [weak self] in
            self?.searchAction()
        }
    }
}
