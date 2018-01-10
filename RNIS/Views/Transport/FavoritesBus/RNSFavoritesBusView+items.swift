//
//  RNSFavoritesBusView+items.swift
//  RNIS
//
//  Created by Артем Кулагин on 02.10.17.
//  Copyright © 2017 Артем Кулагин. All rights reserved.
//

import Foundation

/**
 Класс создание вида для избранных маршрутов с элементами
 */
extension RNSFavoritesBusView {
    
    /// Функция загрузки элементов таблицы
    func loadData() {
        loaderView.showInView(self)
        RNSPostFavoriteRouteList {[weak self] (reply, error, _) in
            self?.loaderView.remove()
            if error?.isLostInet ?? false {
                self?.prepareLostInet()
                return
            }
            
            let items = reply as? [RNSFavoriteStopPoint]
            if items?.count == 0 {
                self?.prepareNoItems()
                return
            }
            
            self?.clearError()
            self?.prepareSections(items)
        }
    }
    
    func prepareLostInet() {
        loaderWay.showCenterLostInet(self)
        clearItems()
    }
    
    func prepareNoItems() {
        loaderWay.prepareTextTop(self,text:"Вы еще не добавляли транспорт в избранное")
        clearItems()
    }
    
    func clearItems() {
        prepareSections(nil)
    }
    
    func clearError() {
        loaderWay.remove()
    }
    
    /// Функция подготовки секций таблицы
    func prepareSections(_ items: [RNSFavoriteStopPoint]?) {
        sections = [TableSection]()
        let beside = items?.filter{ $0.isBeside }
        
        let long = items?.filter{ !(beside?.contains($0) ?? false) }
        
        if let beside =  beside, beside.count > 0 {
            sections.append(TableSection(title: "Менее 1 км", items: beside))
        }
        
        if let long = long, long.count > 0 {
            sections.append(TableSection(title: "Более 1 км", items: long))
        }
        tableView.reloadData()
        //prepareNoItemsIfNeed()
    }
    
    /// Функция отображения остановок ТС
    func showStopPoint(_ item: RNSFavoriteStopPoint?) {
        RNSMapManager.showStopPoint(item?.dict)
    }
}
