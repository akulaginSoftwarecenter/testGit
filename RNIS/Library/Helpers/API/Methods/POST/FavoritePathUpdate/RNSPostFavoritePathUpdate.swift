//
//  RNSPostFavoritePathUpdate.swift
//  RNIS
//
//  Created by Артем Кулагин on 03.10.17.
//  Copyright © 2017 Артем Кулагин. All rights reserved.
//

import UIKit

/**
 Запрос обновления избраного маршрута
 */
class RNSPostFavoritePathUpdate: RNSPostFavoritePathCreate {
    override var subject: String {
        return "com.rnis.mobile.action.favorite_path.update"
    }
}
