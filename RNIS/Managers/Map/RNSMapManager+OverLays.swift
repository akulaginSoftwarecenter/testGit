//
//  RNSMapManager+OverLays.swift
//  RNIS
//
//  Created by Артем Кулагин on 25.07.17.
//  Copyright © 2017 Артем Кулагин. All rights reserved.
//

import Foundation
/**
 Контоллер управления слоев карты
 */
extension RNSMapManager {
    
    /// Функция отображения информации на карте
    static func showInfoIfNeed(_ item: RNSCoordinateModel?) {
        mapCenter(item?.point)
        handlerShowInfo?(item)
    }
    
    /// Создание массива слоев карты
    static var overlays: NSMutableArray? {
        return mapView.overlays()
    }
    
    /// Фнукция создания дополнительно слоя карты
    static func addOverlay(_ obj: Any) {
        guard let overlays = overlays,
            !overlays.contains(self) else {
                return
        }
        overlays.add(obj)
    }
    
    /// Фнукция удаления слоя карты
    static func removeOverlay(_ obj: Any) {
        overlays?.remove(obj)
    }
    
    /// Шаг приближения карты
    static var step: Double {
        let zoom = getZoomLevel
        var step = Double(1966080)
        for _ in 1...zoom {
            step = step/2
        }
        return step
    }
    
    static func showMapRootStopPoint(_ item: RNSFavoriteStopPoint?) {
        RNSMenuManager.mapToRoot()
        showStopPoint(item?.dict)
    }
    
    /// Фнукция показа остановки на карте
    static func showStopPoint(_ dict: AliasDictionary?) {
        guard let dict = dict,
            let item = RNSDataManager.parseBusStopItems([dict])?.first  else {
                return
        }
        RNSMenuManager.showMap()
        RNSMapManager.mapCenter(item.point)
        RNSMapManager.setZoomLevel(16)
        RNSMapManager.showInfoIfNeed(item)
    }
}
