//
//  RNSBusStopDetailController+TableView.swift
//  RNIS
//
//  Created by Артем Кулагин on 10.08.17.
//  Copyright © 2017 Артем Кулагин. All rights reserved.
//

import Foundation

extension RNSBusStopDetailController: UITableViewDelegate, UITableViewDataSource {
    
    func prepareTableView() {
        tableView.reloadData()
        heightTableView.constant = tableView.tableViewContentSize
    }
    
    func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
        return items?.count ?? 0
    }
    
    func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
        let cell = tableView.dequeueReusableCell(for: indexPath) as RNSBusStopDetailCell
        cell.item = item(indexPath)
        return cell
    }
    
    func item(_ indexPath: IndexPath) -> RNSBusRouteTemp? {
        return items?[indexPath.row]
    }
    
    func tableView(_ tableView: UITableView, didSelectRowAt indexPath: IndexPath) {
        let bus = RNSDataManager.buss?.first
        RNSMapManager.showInfoIfNeed(bus)
    }
}
