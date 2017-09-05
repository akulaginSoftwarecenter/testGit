//
//  RNSBusDetailWayView+Delegate.swift
//  RNIS
//
//  Created by Артем Кулагин on 11.08.17.
//  Copyright © 2017 Артем Кулагин. All rights reserved.
//

import Foundation

extension RNSBusDetailWayView: UITableViewDelegate, UITableViewDataSource {
    
    func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
        return itemsCount
    }
    
    func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
        let cell = tableView.dequeueReusableCell(for: indexPath) as RNSBusDetailWayCell
        cell.item = item(indexPath)
        cell.typeItem = typeIndex(indexPath)
        return cell
    }
    
    func item(_ indexPath: IndexPath) -> RNSBusStopTemp? {
        return items?[indexPath.row]
    }
    
    func tableView(_ tableView: UITableView, didSelectRowAt indexPath: IndexPath) {
        let busStop = RNSDataManager.busStop1
        RNSMapManager.showInfoIfNeed(busStop)
    }
    
    func typeIndex(_ indexPath: IndexPath) -> STTypeItemArray {
        let index = indexPath.row
        if index == 0 {
            return .start
        }
        if index == itemsCount - 1 {
            return .end
        }
        return .normal
    }
    
    var itemsCount: Int {
        return items?.count ?? 0
    }
}
