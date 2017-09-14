//
//  RNSLeftMenuController+TableView.swift
//  RNIS
//
//  Created by Артем Кулагин on 01.09.17.
//  Copyright © 2017 Артем Кулагин. All rights reserved.
//

import Foundation

extension RNSLeftMenuController {

    func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
        return menuItems.count;
    }
    
    func tableView(_ tableView: UITableView, heightForRowAt indexPath: IndexPath) -> CGFloat {
        return 42
    }
    
    func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
        let cell = tableView.dequeueReusableCell(withIdentifier: "MenuTableViewCell", for: indexPath) as! MenuTableViewCell;
        let item = self.item(indexPath)
        cell.updateCell(title: item.title, image: item.image)
        return cell
    }
    
    func tableView(_ tableView: UITableView, didSelectRowAt indexPath: IndexPath) {
        tableView.deselectRow(at: indexPath, animated: false)
        
        self.item(indexPath).show()
    }
    
    func item(_ indexPath: IndexPath) -> MenuItem {
        return menuItems[indexPath.row]
    }
}
