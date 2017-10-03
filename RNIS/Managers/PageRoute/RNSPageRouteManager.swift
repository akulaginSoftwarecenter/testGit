//
//  RNSPageRoute.swift
//  RNIS
//
//  Created by Артем Кулагин on 28.08.17.
//  Copyright © 2017 Артем Кулагин. All rights reserved.
//

import UIKit

class RNSPageRouteManager: NSObject {
    
    static var handlerUpdateCurrent: EmptyBlock?
    static var handlerUpdateCurrentTwo: EmptyBlock?
    static var handlerUpdateFavorite: EmptyBlock?
    static var handlerUpdateNotification: EmptyBlock?
    
    static var items: [RNSRouteVariant]? {
        didSet {
            updateAll(items?.first)
        }
    }
    
    static var currentItem: RNSRouteVariant?
    
    static var currentIndex: Int? {
        guard let currentItem = currentItem else {
            return nil
        }
        return items?.index(of: currentItem)
    }
    
    static func prepareFirstNavel(_ distance: CLLocationDistance?) {
        currentItem?.navels?.first?.distance = distance
        currentItem?.updateNodes()
    }
    
    static func removeItem(_ item: RNSRouteVariant?) {
        STRouter.showLoader()
        item?.removeItem {
            STRouter.removeLoader()
            updateNotification()
            updateFavorite()
        }
    }
    
    static func updateName(_ item: RNSRouteVariant?) {
        STRouter.showLoader()
        item?.updateName {
            STRouter.removeLoader()
            updateNotification()
            updateFavorite()
        }
    }
   
    static func showMoveMapStub() {
        RNSPageRouteManager.removeNonActivRoute()
        let item = RNSPageRouteManager.currentItem
        item?.points?.first?.doneMove = true
        RNSPageRouteManager.prepareFirstNavel(523)
        let vc = RNSMoveMapViewController.initController(item)
        vc?.handlerDidDisappear = {
            updateRoads()
            prepareFirstNavel(nil)
        }
        vc?.pushAnimated()
    }

    static func updateNotification() {
        handlerUpdateNotification?()
    }
    
    static func updateFavorite() {
        handlerUpdateFavorite?()
    }
}
