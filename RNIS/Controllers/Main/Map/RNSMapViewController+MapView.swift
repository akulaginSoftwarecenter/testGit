//
//  RNSMapViewController+MapView.swift
//  RNIS
//
//  Created by Артем Кулагин on 20.07.17.
//  Copyright © 2017 Артем Кулагин. All rights reserved.
//

import Foundation

/// Расширение для работы с картой
extension RNSMapViewController {
    /// Функция подготовки контейнера
    override func prepare(for segue: UIStoryboardSegue, sender: Any?) {
        containerController = segue.destination as? RNSMapParentController
        prepareHandlerMapView()
    }
    
    /// Событие обновления карты
    func onMapEvent() {
       
    }
    
    /// Событие нажатия на карту
    ///
    /// - Parameter point: географические координаты места нажатия
    func onMapTouchEvent(_ point: PGGeoPoint) {
        dismissOldPresentVC()
    }
    
    /// Событие длительного нажатия на карту
    ///
    /// - Parameter point: географические координаты места нажатия
    func onMapLongTouchEvent(_ point: PGGeoPoint) {
        RNSBuildRouteView(point)
        mapCenter(point)
        RNSPinBuild(point)
    }
    
    /// Событие добавления оверлея на карту
    ///
    /// - Parameters:
    ///   - overlay: оверлей
    ///   - item: объект, содержащий информацию о географическом положении оверлея
    func onOverlay(_ overlay: PGOverlay!, item: PGOverlayItem!) {
        RNSMapManager.showInfoIfNeed((overlay as? RNSPinItem)?.item)
    }
    
    /// Центрирование карты на указанной точке
    ///
    /// - Parameter point: географические координаты
    func mapCenter(_ point: PGGeoPoint?) {
        RNSMapManager.mapCenter(point)
    }
 }
