//
//  RNSFavoritesBusView+TableView.swift
//  RNIS
//
//  Created by Артем Кулагин on 14.09.17.
//  Copyright © 2017 Артем Кулагин. All rights reserved.
//

import Foundation

extension RNSFavoritesBusView: UITableViewDelegate, UITableViewDataSource {
    
    public func numberOfSections(in tableView: UITableView) -> Int {
        return items.count
    }
    
    func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
        return items[section].count
    }
    
    func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
        let cell = tableView.dequeueReusableCell(for: indexPath) as RNSFavoritesBusCell
        cell.item = item(indexPath)
        return cell
    }
    
    func tableView(_ tableView: UITableView, heightForRowAt indexPath: IndexPath) -> CGFloat {
         return item(indexPath)?.height ?? 0
    }
    
    func item(_ indexPath: IndexPath) -> RNSBusStopTemp? {
        return items[indexPath.section][indexPath.row]
    }
    
    func tableView(_ tableView: UITableView, viewForHeaderInSection section: Int) -> UIView? {
        let view = UIView()
        let label = UILabel()
        label.font = .cffazm20
        label.textColor = .white
        view.addSubview(label)
        label.snp.makeConstraints { make in
            make.left.equalTo(view).inset(15)
            make.bottom.equalTo(view)
        }
        label.text = section == 0 ? "Рядом с вами" : "Далеко"
        return view
    }
}
