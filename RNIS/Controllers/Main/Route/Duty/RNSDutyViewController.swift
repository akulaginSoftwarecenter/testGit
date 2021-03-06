//
//  RNSDutyViewController.swift
//  RNIS
//
//  Created by Артем Кулагин on 15.08.17.
//  Copyright © 2017 Артем Кулагин. All rights reserved.
//

import UIKit

/**
 Контроллер построения маршрута
 */
class RNSDutyViewController: UIViewController {
    
    /// Представление, которое служит индикатором загрузки
    lazy var loaderView = LoaderView()

    @IBOutlet weak var fromPlaceholderLabel: UILabel!
    @IBOutlet weak var fromLabel: UILabel!
    
    @IBOutlet weak var toPlaceholderLabel: UILabel!
    @IBOutlet weak var toLabel: UILabel!
    
    @IBOutlet weak var backButton: RNSLeftBackButton!
    /// Кнопка сброса даты и времени
    @IBOutlet weak var crossButton: UIButton!
    /// Представление для отображения и редактирования даты и времени
    @IBOutlet weak var viewLabelDate: UIView!
    /// Ограничение представления даты и времени справа
    @IBOutlet weak var rightDateConstraint: NSLayoutConstraint!

    /// Кнопка поиска
    @IBOutlet weak var searchButton: RNSBlackButton!
    /// Надпись, отображающая дату и время
    @IBOutlet weak var dateLabel: UILabel!
    
    /// Надпись для отображения ошибок
    @IBOutlet weak var errorLabel: UILabel!
    /// Текущая дата
    var currentDate: Date?
    
    /// Объект, который хранит данные об адресе "откуда"
    var fromItem: RNSDutyAddressTemp?
    /// Объект, хранящий данные адреса "куда"
    var inItem: RNSDutyAddressTemp?
    
    /// Метод инициализации класса
    override func viewDidLoad() {
        super.viewDidLoad()
        
        prepareSearchButton()
    }
}
