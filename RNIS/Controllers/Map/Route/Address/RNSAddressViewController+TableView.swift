//
//  RNSAddressViewController+TableView.swift
//  RNIS
//
//  Created by Артем Кулагин on 16.08.17.
//  Copyright © 2017 Артем Кулагин. All rights reserved.
//

import Foundation

extension RNSAddressViewController: UITableViewDelegate, UITableViewDataSource {
    
    var items: [String] {
        return ["ул. Ленинская 12"]
    }
    
    func prepareTableView() {
        tableView.reloadData()
        heightTableView.constant = tableView.tableViewContentSize
    }
    
    func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
        return items.count
    }
    
    func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
        let cell = tableView.dequeueReusableCell(for: indexPath) as RNSAddressCell
        cell.item = item(indexPath)
        return cell
    }
    
    func item(_ indexPath: IndexPath) -> String {
        return items[indexPath.row]
    }
    
    func tableView(_ tableView: UITableView, didSelectRowAt indexPath: IndexPath) {
        prepareAddress(item(indexPath))
        endEdit()
        print("didSelectRowAt",item(indexPath))
    }
    
}
