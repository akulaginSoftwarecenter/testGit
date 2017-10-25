//
//  RNSPageRouteController+MapView.swift
//  RNIS
//
//  Created by Артем Кулагин on 23.08.17.
//  Copyright © 2017 Артем Кулагин. All rights reserved.
//

import Foundation

/**
 Расширение для работы с картой
 */
extension RNSPageRouteController {
    
    /// Получение карты
    var mapView: MapView {
        return RNSMapManager.mapView
    }
    
    /// Настройка карты
    func prepareMapView() {
        RNSPageRouteManager.currentPrepareDisplay()
    }
    
    override func prepare(for segue: UIStoryboardSegue, sender: Any?) {
        containerController = segue.destination as? RNSMapParentController
        containerController?.bottomTargetConstant = 180
        prepareEnterViewController()
    }
    
    /// Настройка обработчиков событий карты во внутреннем контроллере
    func prepareEnterViewController(){
        containerController?.handlerOnMapEvent = {[weak self] in
            self?.onMapEvent()
        }
        
        containerController?.handlerOnMapTouchEvent = {[weak self] point in
            self?.onMapTouchEvent(point)
        }
    }
    
    /// Обработка нажатия на карту
    ///
    /// - Parameter point: географические координаты места нажатия
    func onMapTouchEvent(_ point: PGGeoPoint) {
        RNSPageRouteManager.checkContaints(point)
    }
    
    /// Обработка обновления карты
    func onMapEvent() {
        RNSPageRouteManager.activeRoadReload()
    }
}
