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
        if typeSegment == .transport {
            return
        }
        request?.cancel()
        if text.characters.count < 3 {
            clearTable()
            removeLoader()
            return
        }
        
        if typeSegment == .stop {
            searchStops()
        } else if typeSegment == .address {
            searchAddress()
        }
    }
    
    func searchStops() {
        loaderView.showInView(self.view)
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
    
    func searchAddress() {
        loaderView.showInView(self.view)
        request = RNSGetSearchAddress(text) { [weak self] items in
            self?.items = items
            self?.tableReload()
            self?.removeLoader()
        }
    }
    
    func removeLoader() {
        loaderView.remove()
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
        if let address = item as? RNSAddressTemp {
            prepareAddress(address)
        } else if let stop = item as? RNSBusStopTemp {
            STRouter.pop {
                RNSMapManager.showStopPoint(stop.toJSON())
            }
        } else if (item as? RNSBusTemp) != nil {
            STRouter.pop {
                let bus = RNSDataManager.buss?.first
                RNSMapManager.showInfoIfNeed(bus)
            }
        }
    }
    
    func prepareAddress(_ item: RNSAddressTemp) {
        if !item.isHouse {
             textField.text = item.name
            updateSearch()
            return
        }
        STRouter.pop {
            RNSMapManager.mapCenter(item.point)
            RNSMapManager.setZoomLevel(14)
        }
    }
    
    func  prepareError(_ error: String?) {
        errorLabel.text = error
    }
    
    func clearError() {
        errorLabel.text = nil
    }
}
