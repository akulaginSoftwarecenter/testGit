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
        
        if typeSegment == .transport {
            return
        }
        request?.cancel()
        if text.count < 3 {
            clearTable()
            clearError()
            removeLoader()
            return
        }
        
        if typeSegment == .stop {
            searchStops()
        } else if typeSegment == .address {
            searchAddress()
        }
    }
    
    /// Запрос на поиск остановок
    func searchStops() {
        loaderView.showInView(self.view)
        request = RNSPostSearch(text, type:typeSegment, complete: { [weak self] items in
            self?.prepareItems(items as? [RNSTextItem])
            }, failure: { [weak self] text in
                self?.prepareClearError(text)
        })
    }
    
    /// Запрос на поиск адресов
    func searchAddress() {
        loaderView.showInView(self.view)
        request = RNSGetSearchAddress(text, complete: { [weak self] items in
            self?.prepareItems(items)
            }, failure: { [weak self] text in
                self?.prepareClearError(text)
        })
    }
    
    func prepareItems(_ items: [RNSTextItem]?) {
        self.items = items
        tableReload()
        removeLoader()
        clearError()
    }
    
    /// Убрать индикатор загрузки
    func removeLoader() {
        loaderView.remove()
    }

    func gen(element: ((Int) -> (RNSTextItem))) {
        var items = [RNSTextItem]()
        for i in (0...Int.rand(0, limit: 20)) {
            items.append(element(i))
        }
        self.items = items
        tableReload()
    }
    
    /// Показать детальную информацию о выбранном объекте из списка
    ///
    /// - Parameter indexPath: индекс выбранного объекта
    func showItem(_ indexPath: IndexPath) {
        let item = self.item(indexPath)
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
    
    func prepareClearError(_ error: String?) {
        prepareError(error)
        clearTable()
        removeLoader()
    }
    
    func  prepareError(_ error: String?) {
        errorLabel.text = error
    }
    
    func clearError() {
        errorLabel.text = nil
    }
}
