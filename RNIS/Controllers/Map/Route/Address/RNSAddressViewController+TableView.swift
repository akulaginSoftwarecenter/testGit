//
//  RNSAddressViewController+TableView.swift
//  RNIS
//
//  Created by Артем Кулагин on 16.08.17.
//  Copyright © 2017 Артем Кулагин. All rights reserved.
//

import Foundation
import RealmSwift

extension RNSAddressViewController: UITableViewDelegate, UITableViewDataSource {
    
    var items: [RNSSearchHistory]? {
        return RNSDataManager.searchItems(text)
    }
    
    func prepareTableView() {
        tableView.reloadData()
        heightTableView.constant = tableView.tableViewContentSize
    }
    
    func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
        return items?.count ?? 0
    }
    
    func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
        let cell = tableView.dequeueReusableCell(for: indexPath) as RNSAddressCell
        cell.item = item(indexPath)
        return cell
    }
    
    func item(_ indexPath: IndexPath) -> String? {
        return items?.valueAt(indexPath.row)?.title
    }
    
    func tableView(_ tableView: UITableView, didSelectRowAt indexPath: IndexPath) {
        guard let cell = tableView.cellForRow(at: indexPath) as? RNSAddressCell, let item = cell.item else {
            return
        }
        prepareAddress(item)
        endEdit()
    }
}