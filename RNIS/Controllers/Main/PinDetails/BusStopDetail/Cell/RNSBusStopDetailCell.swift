//
//  RNSBusStopDetailCell.swift
//  RNIS
//
//  Created by Артем Кулагин on 10.08.17.
//  Copyright © 2017 Артем Кулагин. All rights reserved.
//

import UIKit


/// Табличная ячейка для отображения информации об автобусной остановке
class RNSBusStopDetailCell: RNSBaseTableCell {
    
    /// Кнопка "добавить в избранное"
    @IBOutlet weak var favoriteButton: UIButton!
    /// Кнопка "обновить данные о расписании"
    @IBOutlet weak var alertButton: UIButton!
    
    /// Надпись, где указывается количество минут до приезда ближайшего автобуса
    @IBOutlet weak var minuteLabel: UILabel!
    /// Ограничение расположения надписи номера автобуса относительно центра по вертикали
    @IBOutlet weak var numCenterConstraint: NSLayoutConstraint!
    /// Надпись номера автобуса
    @IBOutlet weak var numLabel: UILabel!
    /// Надпись "следующий"
    @IBOutlet weak var nextLabel: UILabel!

    /// Блок, который выполняется при получении уведомления об обновлении данных
    var updateNotification: EmptyBlock?
    /// Блок, который выполняется при обновлении избранного
    var updateFavorite: EmptyBlock?
    
    /// Модель маршрута автобуса
    var item: RNSBusRouteTemp? {
        didSet {
            prepareUI()
        }
    }
    
    /// Настройка представлений
    func prepareUI() {
        prepareFavorites()
        prepareTime()
        numLabel.text = item?.number
        prepareShowNext()
        prepareAlert()
    }
    
    /// Настройка надписи с отображением времени до следующего автобуса
    func prepareTime() {
        if let time = item?.time {
            minuteLabel.text = "\(time) мин."
        }
    }
    
    /// Настройка кнопки обновления данных
    func prepareAlert() {
        let in_notifications = item?.in_notifications ?? false
        alertButton.setImage(in_notifications ? #imageLiteral(resourceName: "bellFill"): #imageLiteral(resourceName: "bell"), for: UIControlState())
    }
    
    /// Настройка кнопки "добавить в избранное"
    func prepareFavorites() {
        let in_favorites = item?.in_favorites ?? false
        favoriteButton.setImage(in_favorites ?#imageLiteral(resourceName: "flagFill2") : #imageLiteral(resourceName: "flag"), for: UIControlState())
    }
    
    /// Настройка надписи "следующий"
    func prepareShowNext() {
        let showNext = item?.next ?? false
        nextLabel.isHidden = !showNext
        numCenterConstraint.constant = showNext ? -6 : 0
    }
}
