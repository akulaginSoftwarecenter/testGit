//
//  RNSMapViewController+Handlers.swift
//  RNIS
//
//  Created by Артем Кулагин on 21.07.17.
//  Copyright © 2017 Артем Кулагин. All rights reserved.
//

import Foundation

/**
 Расширение для работы с клоужерами
 */
extension RNSMapViewController {
    
    /// Настройка блоков обработки некоторых событий
    func prepareHandlers() {
        prepareHandlerMapView()
        
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
    
    /// Настройка блоков обработки событий карты
    func prepareHandlerMapView(){
        containerController?.handlerOnMapEvent = {[weak self] in
            self?.onMapEvent()
        }
        
        containerController?.handlerOnMapTouchEvent = {[weak self] point in
            self?.onMapTouchEvent(point)
        }
        
        containerController?.handlerOnMapLongTouchEvent = {[weak self] point in
            self?.onMapLongTouchEvent(point)
        }
        
        containerController?.handlerOnOverlay = {[weak self] point,item in
            self?.onOverlay(point, item: item)
        }
    }
}
