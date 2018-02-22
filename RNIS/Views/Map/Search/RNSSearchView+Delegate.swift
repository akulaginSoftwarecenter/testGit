//
//  RNSSearchView+Delegate.swift
//  RNIS
//
//  Created by Артем Кулагин on 23.11.2017.
//  Copyright © 2017 Артем Кулагин. All rights reserved.
//

import Foundation

extension RNSSearchView: UITableViewDelegate, UITableViewDataSource {
    
    /// Метод возврата количества строк в секции
    func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
        return items?.count ?? 0
    }
    
    /// Метод возврата строки
    func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
        let cell = tableView.dequeueReusableCell(for: indexPath) as RNSSearchCell
        cell.item = item(indexPath)
        return cell
    }
    
    /// Метод обработки строки по тапу
    func tableView(_ tableView: UITableView, didSelectRowAt indexPath: IndexPath) {
        showItem(item(indexPath))
    }
    
    /// Метод возврата высоты строк
    func tableView(_ tableView: UITableView, heightForRowAt indexPath: IndexPath) -> CGFloat {
        let item = self.item(indexPath)
        return item?.heightAtWidth(widthCell) ?? kSearchViewCellDefaultHeight
    }
    
    /// Метод возврата элемена в массиве по индексу
    func item(_ indexPath: IndexPath) -> RNSTextItem? {
        return items?[indexPath.row]
    }
    
    func clearTable() {
        items = nil
        tableReload()
    }
    
    func tableReload() {
        tableView.reloadData()
        heightTableView?.constant = tableView.tableViewContentSize + tableView.contentInset.top
    }
}
