//
//  MenuItem.swift
//  RNIS
//
//  Created by Артем Кулагин on 01.09.17.
//  Copyright © 2017 Артем Кулагин. All rights reserved.
//

import Foundation

struct MenuItem {
    
    var vc: BaseNavigationController?
    var title: String?
    var image: UIImage?
    
    init(_ title: String?, _ rootViewController: UIViewController?, _ image: UIImage?) {
        self.title = title
        if let rootViewController = rootViewController {
            self.vc = BaseNavigationController(rootViewController: rootViewController)
        }
        self.image = image
    }
    
    func show() {
        updateIfNeed()
        RNSMenuManager.showItem(self)
    }
    
    func updateIfNeed() {
        if title == kStrelka {
            RNSMenuManager.handlerStrelkaUpdate?()
        }
        if title == kNews {
            RNSMenuManager.handlerNewsUpdate?()
        }
        if title == favoriteTitle {
            RNSPageRouteManager.handlerUpdateFavorite?()
            RNSMenuManager.handlerUpdateFavoriteBuss?()
        }
        
        if title == notificationTitle {
            RNSMenuManager.handlerUpdateNotification?()
        }
    }
}
