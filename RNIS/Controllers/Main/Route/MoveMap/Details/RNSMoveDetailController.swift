//
//  RNSMoveDetailController.swift
//  RNIS
//
//  Created by Артем Кулагин on 31.08.17.
//  Copyright © 2017 Артем Кулагин. All rights reserved.
//

import UIKit

/**
Контроллер для отображения детальной информации следования по маршруту
 */

class RNSMoveDetailController: UIViewController {
    
    /// Блок, который ввызывается при возврате на предыдущий контролле
    var handlerBack: EmptyBlock?
    
    /// Объект с информацией о маршруте
    var item: RNSRouteVariant?
    /// Представление добавления в избранное
    @IBOutlet weak var flagView: RNSFlagButton!
    
    /// Представление для отображения детальной информации о маршруте
    @IBOutlet weak var detailView: RNSRouteDetailView!
    
    /// Создание контроллера
    ///
    /// - Parameter item: объект с информацией о маршруте
    static func initController(_ item: RNSRouteVariant?) -> RNSMoveDetailController?  {
        let vc = RNSMoveDetailController.initialControllerType()
        vc?.item = item
        return vc
    }
    
    /// Метод инициализации класса
    override func viewDidLoad() {
        super.viewDidLoad()
        
        detailView.showMove = true
        prepareItem()
        updateFlagImage()
        prepareObservers()
        prepareHandlers()
    }
    
    /// Контроллер подписывается на получение уведомлений
    func prepareObservers() {
        NotificationCenter.addObserverLocation(self, selector: #selector(updateItem))
    }
    
    /// Обновление представления с детальной информацией о маршруте
    func prepareItem() {
        if detailView == nil {
            return
        }
        detailView.item = item?.tableItem
    }
    
    @objc func updateItem() {
        detailView.prepareMove()
    }
    
    /// Событие нажатия на кнопку возврата на предыдущий экран
    @IBAction func actionBack(_ sender: Any) {
        handlerBack?()
    }
    
    deinit {
         NotificationCenter.removeObserver(self)
    }
}
