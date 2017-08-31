//
//  RNSRouteDetailView.swift
//  RNIS
//
//  Created by Артем Кулагин on 31.08.17.
//  Copyright © 2017 Артем Кулагин. All rights reserved.
//

import UIKit

class RNSRouteDetailView: BaseViewWithXIBInit {
    
    var item: RNSRouteTable? {
        didSet{
            tableView.reloadData()
        }
    }
    
    @IBOutlet var tableView: RNSRegisterTableView!
    
    var items: [RNSRouteTableItem] {
        return item?.itemsStill ?? []
    }
    
    override func awakeFromNib() {
        super.awakeFromNib()
        
        tableView.contentInset = UIEdgeInsetsMake(47, 0, 0, 0)
    }
    
    func item(_ indexPath: IndexPath) -> RNSRouteTableItem {
        return items[indexPath.row]
    }
    
    func animateInsertStill(_ indexPath: IndexPath) {
        let item = self.item(indexPath)
        let indexPaths = item.indexPatchs(indexPath)
        tableView.beginUpdates()
        tableView.reloadRows(at: [indexPath], with: .fade)
        if item.openStill {
            tableView.insertRows(at: indexPaths, with: .bottom)
        } else {
            tableView.deleteRows(at: indexPaths, with: .top)
        }
        tableView.endUpdates()
    }
}
