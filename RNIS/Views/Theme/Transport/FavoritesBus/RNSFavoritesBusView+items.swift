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
            if error != nil {
                self?.parseError(error)
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
        prepareTextTop("Вы еще не добавляли транспорт в избранное")
        clearItems()
    }
    
    func clearItems() {
        prepareSections(nil)
    }
    
    /// Метод очистки ошибок
    func clearError() {
        loaderWay.remove()
    }
    
    func parseError(_ error: NSError?) {
        if error?.isLostInet ?? false {
            prepareLostInet()
        } else {
            prepareTextTop(error?.domain)
        }
    }
    
    func prepareTextTop(_ text: String?) {
        loaderWay.prepareTextTop(self,text: text)
        clearItems()
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
}
