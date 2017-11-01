//
//  RNSRouteDetailView.swift
//  RNIS
//
//  Created by Артем Кулагин on 31.08.17.
//  Copyright © 2017 Артем Кулагин. All rights reserved.
//

import UIKit

/**
 Представление отображает схему маршрута
 */
class RNSRouteDetailView: BaseViewWithXIBInit {
    
    /// Содель схемы маршрута
    var item: RNSRouteTable? {
        didSet{
            prepareItems()
            tableView.reloadData()
        }
    }
    
    @IBOutlet var tableView: RNSRegisterTableView!
    
    var showMove = false
    var items = [RNSRouteTableItem]()
    /*
    /// массив моделей
    var items: [RNSRouteTableItem] {
        let items = item?.itemsStill
        items?.prepareShowArrow()
        return items ?? []
    }
    */
    func prepareItems() {
        guard let items = item?.itemsStill else {
            return
        }
        items.prepareShowArrow()
        self.items = items
    }
    
    override func awakeFromNib() {
        super.awakeFromNib()
        
        tableView.contentInset = UIEdgeInsetsMake(47, 0, 0, 0)
    }
    
    /// Получение модели для ячейки
    ///
    /// - Parameter indexPath: индекс ячейки
    /// - Returns: модель ячейки таблицы
    func item(_ indexPath: IndexPath) -> RNSRouteTableItem {
        return items[indexPath.row]
    }
    
    /// Анимарование вставки пунктов в таблицу
    ///
    /// - Parameter indexPath: индекс вставки
    func animateInsertStill(_ indexPath: IndexPath) {
        let item = self.item(indexPath)
        let indexPaths = item.indexPatchs(indexPath)
        tableView.beginUpdates()
        tableView.reloadRows(at: [indexPath], with: .none)
        if item.openStill {
            tableView.insertRows(at: indexPaths, with: .none)
        } else {
            tableView.deleteRows(at: indexPaths, with: .none)
        }
        tableView.endUpdates()
    }
}
