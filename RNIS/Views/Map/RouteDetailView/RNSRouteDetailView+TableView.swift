//
//  RNSRouteDetailView+TableView.swift
//  RNIS
//
//  Created by Артем Кулагин on 31.08.17.
//  Copyright © 2017 Артем Кулагин. All rights reserved.
//

import Foundation

extension RNSRouteDetailView: UITableViewDelegate, UITableViewDataSource {
    
    func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
        return items.count
    }
    
    func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
        let item = self.item(indexPath)
        let cell: RNSRouteParentCell
        switch item.type {
        case .stop:
            cell = tableView.dequeueReusableCell(for: indexPath) as RNSRouteStopCell
            break
        case .still:
            cell = tableView.dequeueReusableCell(for: indexPath) as RNSRouteStillCell
            break
        case .bus:
            cell = tableView.dequeueReusableCell(for: indexPath) as RNSRouteBusCell
            break
        case .total:
            cell =  tableView.dequeueReusableCell(for: indexPath) as RNSRouteTotalCell
            break
        }
        cell.item = item
        return cell
    }
    
    func tableView(_ tableView: UITableView, didSelectRowAt indexPath: IndexPath) {
        let item = self.item(indexPath)
        if item.isStill {
            item.openStill = !item.openStill
            animateInsertStill(indexPath)
        }
    }
    
    func tableView(_ tableView: UITableView, heightForRowAt indexPath: IndexPath) -> CGFloat {
        return items[indexPath.row].height
    }
}
