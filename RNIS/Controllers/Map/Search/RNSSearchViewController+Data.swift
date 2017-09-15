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
        
        if text == "" {
            items = [RNSTextItem]()
            tableReload()
            return
        }
        
        switch typeSegment {
        case .address:
            genAddress()
            break
        case .stop:
            genStop()
            break
        case .transport:
            genTransport()
            break
        }
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
}
