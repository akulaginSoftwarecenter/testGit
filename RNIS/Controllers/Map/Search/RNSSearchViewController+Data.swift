//
//  RNSSearchViewController+Data.swift
//  RNIS
//
//  Created by Артем Кулагин on 14.08.17.
//  Copyright © 2017 Артем Кулагин. All rights reserved.
//

import Foundation

extension RNSSearchViewController {
    
    var text: String {
        return textField.text ?? ""
    }
    
    func updateSearch() {
        RNSSearchManager.text = text
        RNSSearchManager.type = typeSegment
        clearError()
        
        if text == "" {
            clearTable()
            return
        }
        loaderView.showInView(self.view)
        request?.cancel()
        request = RNSPostSearch(text, type:typeSegment, complete: { [weak self] items in
            self?.items = (items as? [RNSTextItem])
            self?.tableReload()
            self?.removeLoader()
        }, failure: { [weak self] text in
            self?.prepareError(text)
            self?.clearTable()
            self?.removeLoader()
        })

    }
    
    func removeLoader() {
        loaderView.remove()
    }
    
    func genAddress() {
        gen { (index) -> (RNSTextItem) in
            let item = RNSAddressTemp()
            item.text = text + "genAddress" + "\(Int.rand(0, limit: 20))"
            return item
        }
    }
    
    func genStop() {
        gen { (index) -> (RNSTextItem) in
            let item = RNSBusStopTemp()
            item.text = text + "genStop" + "\(Int.rand(0, limit: 20))"
            return item
        }
    }
    
    func genTransport() {
        gen { (index) -> (RNSTextItem) in
            let item = RNSBusTemp()
            item.text = text + "genTransport" + "\(Int.rand(0, limit: 20))"
            return item
        }
    }
    
    func gen(element: ((Int) -> (RNSTextItem))) {
        var items = [RNSTextItem]()
        for i in (0...Int.rand(0, limit: 20)) {
            items.append(element(i))
        }
        self.items = items
        tableReload()
    }
    
    func showItem(_ indexPath: IndexPath) {
        let item = self.item(indexPath)
        if (item as? RNSAddressTemp) != nil {
            RNSMapManager.mapCenter(RNSLocationManager.point)
        } else if (item as? RNSBusStopTemp) != nil {
            let stop = RNSDataManager.busStops?.first
            RNSMapManager.showInfoIfNeed(stop)
        } else if (item as? RNSBusTemp) != nil {
            let bus = RNSDataManager.buss?.first
            RNSMapManager.showInfoIfNeed(bus)
        }
    }
    
    func  prepareError(_ error: String?) {
        errorLabel.text = error
    }
    
    func clearError() {
        errorLabel.text = nil
    }
}
