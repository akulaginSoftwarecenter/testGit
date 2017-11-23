//
//  RNSSearchViewController+Data.swift
//  RNIS
//
//  Created by Артем Кулагин on 14.08.17.
//  Copyright © 2017 Артем Кулагин. All rights reserved.
//

import Foundation

extension RNSSearchViewController {
    
    /// Получение текста поискового запроса
    var text: String {
        return textField.text ?? ""
    }
    
    /// Обработчик события обновления поискового запроса
    func updateSearch() {
        RNSSearchManager.text = text
        RNSSearchManager.type = typeSegment
        searchView.prepare(text, typeSegment: typeSegment)
    }

    /// Показать детальную информацию о выбранном объекте из списка
    ///
    /// - Parameter indexPath: индекс выбранного объекта
    func showItem(_ item: RNSTextItem?) {
        //let item = self.item(indexPath)
        if let address = item as? RNSAddressTemp {
            prepareAddress(address)
        } else if let stop = item as? RNSBusStopTemp {
            STRouter.pop {
                RNSMapManager.showStopPoint(stop.toJSON())
            }
        } else if (item as? RNSBusTemp) != nil {
            STRouter.pop {
                let bus = RNSDataManager.buss?.first
                RNSMapManager.showInfoIfNeed(bus)
            }
        }
    }
    
    /// Возврат на контроллер с картой с последующей демонстрацией адреса и маршрута
    ///
    /// - Parameter item: модель адреса
    func prepareAddress(_ item: RNSAddressTemp) {
        let name = item.name
        if !item.isHouse,
            text != name {
            textField.text = name
            updateSearch()
            return
        }
        
        STRouter.popToRoot {
            RNSMapManager.mapCenter(item.point)
            RNSMapManager.setMaxZoom()
            RNSBuildRouteView(item.point)
            RNSPinBuild(item.point!)
        }
    }
}
