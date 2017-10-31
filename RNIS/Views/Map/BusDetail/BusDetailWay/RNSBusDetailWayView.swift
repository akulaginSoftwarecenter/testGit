//
//  RNSBusDetailWayView.swift
//  RNIS
//
//  Created by Артем Кулагин on 10.08.17.
//  Copyright © 2017 Артем Кулагин. All rights reserved.
//

import UIKit
import RealmSwift

/**
 Представление отображает схему маршрута автобуса
 */
class RNSBusDetailWayView: BaseViewWithXIBInit {
    
    @IBOutlet weak var tableView: UITableView!
    @IBOutlet weak var heightTableView: NSLayoutConstraint!
    lazy var loaderView = LoaderView()
    
    var items: [RNSBusTableItem]?
    
    var tableModel: RNSBusTableModel? {
        didSet {
            reloadData()
        }
    }
    
    var itemBus: RNSBus? {
        didSet {
            loaderView.showInView(self)
            RNSPostBusGet(itemBus) {[weak self] item in
                self?.loaderView.remove()
                self?.item = item
            }
        }
    }
    
    /// Модель автобуса
    var item: RNSBusTemp?{
        didSet {
            Utils.queueUserInitiated {
                CounterTime.startTimer()
                self.tableModel = self.item?.tableModel
                CounterTime.endTimer()
            }
        }
    }

    /// Обновление представления
    func reloadData() {
        Utils.queueUserInitiated {
            self.items = self.tableModel?.itemsStill
            Utils.mainQueue {
                self.tableView.reloadData()
                self.heightTableView.constant = self.tableView.tableViewContentSize
            }
        }
    }
    
    /// Анимированное раскрывание пункта, содержащего подпункты
    ///
    /// - Parameter indexPath: индекс элемента в таблице
    func animateInsertStill(_ indexPath: IndexPath) {
        guard let item = self.item(indexPath) else {
            return
        }
        items = tableModel?.itemsStill
        let indexPaths = item.indexPatchs(indexPath)
        tableView.beginUpdates()
        tableView.reloadRows(at: [indexPath], with: .fade)
        if item.openStill {
            tableView.insertRows(at: indexPaths, with: .bottom)
        } else {
            tableView.deleteRows(at: indexPaths, with: .top)
        }
        tableView.endUpdates()
        self.heightTableView.constant = self.tableView.tableViewContentSize
    }
}
