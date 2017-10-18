//
//  RNSFavoritesBusCell+TableView.swift
//  RNIS
//
//  Created by Артем Кулагин on 14.09.17.
//  Copyright © 2017 Артем Кулагин. All rights reserved.
//

import Foundation

/**
 Favorites Bus Cell + Table View
 */

extension RNSFavoritesBusCell: UITableViewDelegate, UITableViewDataSource {
    
    func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
        return items?.count ?? 0
    }
    
    func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
        let cell = tableView.dequeueReusableCell(for: indexPath) as RNSForecastCell
        cell.item = item(indexPath)
        return cell
    }
    
    func item(_ indexPath: IndexPath) -> RNSForecastBus? {
        return items?[indexPath.row]
    }
}
