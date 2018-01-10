//
//  RNSRouteVariant+Query.swift
//  RNIS
//
//  Created by Артем Кулагин on 03.10.17.
//  Copyright © 2017 Артем Кулагин. All rights reserved.
//

import Foundation

extension RNSRouteVariant {
    
    func updateName(complete: EmptyBlock?) {
        RNSPostFavoritePathUpdate(self) { uuid in
              complete?()
        }
    }
}
