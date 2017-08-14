//
//  RNSSearchViewController+TableView.swift
//  RNIS
//
//  Created by Артем Кулагин on 14.08.17.
//  Copyright © 2017 Артем Кулагин. All rights reserved.
//

import Foundation

extension RNSSearchViewController: UITableViewDelegate, UITableViewDataSource {
    
    func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
        return items.count
    }
    
    func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
        let cell = tableView.dequeueReusableCell(for: indexPath) as RNSSearchCell
        cell.item = item(indexPath)
        return cell
    }
    
    func tableView(_ tableView: UITableView, didSelectRowAt indexPath: IndexPath) {
        STRouter.pop { [weak self] in
            self?.showItem(indexPath)
        }
    }
    
    func item(_ indexPath: IndexPath) -> RNSTextItem {
        return items[indexPath.row]
    }
    
    func clearTable() {
        items = []
        tableReload()
    }
    
    func tableReload() {
        tableView.reloadData()
    }
}
