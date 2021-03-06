//
//  TransportViewController.swift
//  menuInfo
//
//  Created by Ilya Inyushin on 30.08.17.
//  Copyright © 2017 Ilya Inyushin. All rights reserved.
//

import UIKit

/**
 Контроллер показывает список "избранного транспорта"
 */
class TransportViewController: UIViewController {

    /// Представление переключения вкладок
    @IBOutlet weak var segmentControl: UISegmentedControl!
    
    //var isNeedCheckToken = true
    
    /// Надпись заголовка контроллера
    @IBOutlet weak var titleLable: RNSTopTitle!
    /// Представление списка "избранных" автобусов
    @IBOutlet weak var favoritesBusView: RNSFavoritesBusView!
    /// Представление списка схем маршрутов "избранных" автобусов
    @IBOutlet weak var myRoutesView: RNSTransportTableView!

    /// Метод инициализации класса
    override func viewDidLoad() {
        super.viewDidLoad()
        
        prepareSegment()
    }
    
    /// метод обработки появления контроллера
    override func viewDidAppear(_ animated: Bool) {
        super.viewDidAppear(animated)
        
        updateItemsIfNeed()
       // checkEmail()
    }
    
    /// Проверка наличия токена сессии
    func checkEmail() {
        Utils.checkEmailShowAlert()
    }
}
