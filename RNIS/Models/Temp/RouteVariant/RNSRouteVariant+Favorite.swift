//
//  RNSRouteVariant+Favorite.swift
//  RNIS
//
//  Created by Артем Кулагин on 10.01.2018.
//  Copyright © 2018 Артем Кулагин. All rights reserved.
//

import Foundation

/**
 Расширение для работы с избранными
 */
extension RNSRouteVariant {
    
    var isFavorite: Bool {
        return uuid != nil
    }
    
    func changeFavorite() {
        if isFavorite {
            removeFavoriteServer()
        } else {
            name = "Мой маршрут"
            RNSPostFavoritePathCreate(self) { [weak self] uuid in
                self?.uuid = uuid
                self?.updateFlagFavorite()
            }
        }
    }
    
    func removeFavoriteServer(complete: EmptyBlock? = nil) {
        RNSPostFavoritePathDelete(self) { [weak self] in
            complete?()
            self?.removeFavoriteUuid()
            self?.updateFlagFavorite()
        }
    }
    
    func removeFavoriteUuid() {
         uuid = nil
    }
    
    func removeFavoriteLocal() {
        removeFavoriteUuid()
        updateFlagFavorite()
    }
    
    func updateFlagFavorite() {
        NotificationCenter.postUpdateFavorite()
    }
}
