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
        let vc = RNSMoveDetailController.initialController as? RNSMoveDetailController
        vc?.item = item
        return vc
    }
    
    override func viewDidLoad() {
        super.viewDidLoad()
        
        detailView.showMove = true
        updateItem()
        prepareFlagView()
        prepareObservers()
    }
    
    /// Контроллер подписывается на получение уведомлений
    func prepareObservers() {
        NotificationCenter.addObserverLocation(self, selector: #selector(updateItem))
    }
    
    /// Обновление представления с детальной информацией о маршруте
    @objc func updateItem() {
        if detailView == nil {
            return
        }
        detailView.item = item?.tableItem
    }
    
    override class var storyboardName: String {
        return "RNSMoveDetailController"
    }
    
    /// Событие нажатия на кнопку возврата на предыдущий экран
    @IBAction func actionBack(_ sender: Any) {
        handlerBack?()
    }
    
    deinit {
        print("RNSMoveDetailController deinit")
        NotificationCenter.removeObserver(self)
    }
}
