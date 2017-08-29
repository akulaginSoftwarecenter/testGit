//
//  RNSRouteDetailController+TableView.swift
//  RNIS
//
//  Created by Артем Кулагин on 29.08.17.
//  Copyright © 2017 Артем Кулагин. All rights reserved.
//

import Foundation

extension RNSRouteDetailController: UITableViewDelegate, UITableViewDataSource {
    
    func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
        return items.count
    }
    
    func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
        let item = items[indexPath.row]
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
}

