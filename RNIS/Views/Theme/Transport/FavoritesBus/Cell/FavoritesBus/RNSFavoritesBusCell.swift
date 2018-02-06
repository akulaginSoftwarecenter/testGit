//
//  RNSFavoritesBusCell.swift
//  RNIS
//
//  Created by Артем Кулагин on 14.09.17.
//  Copyright © 2017 Артем Кулагин. All rights reserved.
//

import UIKit

/**
 Ячейки для таблицы избранных ТС
 */

class RNSFavoritesBusCell: RNSBaseTableCell {

    /// Действие по нажатию кнопки удалить
    var didTapDelete: ((RNSFavoriteStopPoint) -> ())?
    
    /// Создание "слабого" экземпляра таблицы
    @IBOutlet weak var tableView: UITableView!
    /// Создание "слабого" экземпляра поля названия экрана
    @IBOutlet weak var topTitle: UILabel!
    
    /// Создание экземпляра избранной остановки
    var item: RNSFavoriteStopPoint! {
        didSet {
            updateUI()
        }
    }

    /// Массив с плановыми маршрутами для уведомлений
    var items: [RNSForecastBus]? {
        return item?.forecast
    }
    
    /// Функция обновления вида
    func updateUI() {
        topTitle.text = item?.stop_point_title ?? ""
        tableView.reloadData()
    }
    
    func showStopPoint() {
        RNSMenuManager.mapToRoot()
        RNSMapManager.showStopPoint(item?.dict)
    }
    
    @IBAction func deleteBusStopAction(_ sender: Any) {
        stopCurrentDelete()
    }
    
    func stopCurrentDelete(route_number: String? = nil) {
        STRouter.showLoader()
        RNSPostFavoriteRouteDelete(route_number: route_number, stop_point_uuid: item.stop_point_uuid) {
            STRouter.removeLoader()
            RNSMenuManager.updateFavoriteBuss()
            RNSMapManager.stopDetailUpdate()
        }
    }
}
