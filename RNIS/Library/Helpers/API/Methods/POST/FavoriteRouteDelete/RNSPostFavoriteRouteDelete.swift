//
//  RNSPostFavoriteRouteDelete.swift
//  RNIS
//
//  Created by Артем Кулагин on 29.09.17.
//  Copyright © 2017 Артем Кулагин. All rights reserved.
//

import UIKit

class RNSPostFavoriteRouteDelete: RNSPostFavoriteRouteCreate {
    override var subject: String {
        return "com.rnis.mobile.action.favorite_route.delete"
    }
}
