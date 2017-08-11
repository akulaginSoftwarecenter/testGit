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
        let cell = tableView.dequeueReusableCell(withIdentifier: RNSBusDetailWayCell.reuseIdentifier, for: indexPath) as! RNSBusDetailWayCell
        //let cell = tableView.dequeueReusableCell(for: indexPath) as! RNSBusDetailWayCell
        cell.item = items?[indexPath.row]
        cell.typeItem = typeIndex(indexPath)
        return cell
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
