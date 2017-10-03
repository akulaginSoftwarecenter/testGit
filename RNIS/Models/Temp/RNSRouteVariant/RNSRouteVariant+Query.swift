//
//  RNSRouteVariant+Query.swift
//  RNIS
//
//  Created by Артем Кулагин on 03.10.17.
//  Copyright © 2017 Артем Кулагин. All rights reserved.
//

import Foundation

extension RNSRouteVariant {
    func changeFavorite(complete: EmptyBlock?) {
        if isFavorite {
            removeItem(complete: complete)
        } else {
            name = "Мой маршрут"
            RNSPostFavoritePathCreate(self) { [weak self] uuid in
                self?.uuid = uuid
                complete?()
            }
        }
    }
    
    func removeItem(complete: EmptyBlock?) {
        RNSPostFavoritePathDelete(self) { [weak self] in
            self?.uuid = nil
            complete?()
        }
    }
    
    func updateName(complete: EmptyBlock?) {
        RNSPostFavoritePathUpdate(self) { uuid in
              complete?()
        }
    }
}
