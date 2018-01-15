//
//  RNSTransportTableView+Items.swift
//  RNIS
//
//  Created by Артем Кулагин on 15.01.2018.
//  Copyright © 2018 Артем Кулагин. All rights reserved.
//

import Foundation

extension RNSTransportTableView {
    /// Функция обновления вида элементов экрана
    func updateUI() {
        showLoader()
        RNSPostFavoritePathList {[weak self] (reply, error, _) in
            self?.loaderView.remove()
            if error != nil {
                self?.parseError(error)
                return
            }
            
            let items = reply as? [RNSRouteVariant]
            if (items?.count ?? 0) == 0 {
                self?.prepareNoItems()
                return
            }
            self?.clearError()
            self?.prepareItems(items)
        }
    }
    
    func prepareItems(_ items: [RNSRouteVariant]?) {
        self.items = items
        tableView.reloadData()
    }
    
    func prepareLostInet() {
        loaderWay.showCenterLostInet(self)
        clearItems()
    }
    
    func prepareNoItems() {
        prepareTextTop("Вы еще не добавляли свои маршруты")
        clearItems()
    }
    
    func clearItems() {
        prepareItems(nil)
    }
    
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
}