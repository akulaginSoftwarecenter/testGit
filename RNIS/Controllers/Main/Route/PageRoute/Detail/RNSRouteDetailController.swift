//
//  RNSRouteDetailViewController.swift
//  RNIS
//
//  Created by Артем Кулагин on 29.08.17.
//  Copyright © 2017 Артем Кулагин. All rights reserved.
//

import UIKit

/**
 Контроллер для отображения детальной информации о маршруте
 */
class RNSRouteDetailController: UIViewController {
    
    /// Представление для отображения кнопки "добавить в избранное"
    @IBOutlet weak var flagView: RNSFlagButton!
    /// Объект, содержащий информацию о маршруте
    var item: RNSRouteVariant? {
        didSet {
            if detailView != nil {
                updateData()
            }
        }
    }
    
    /// Блок, который вызывается перед выходом из контроллера
    var handlerBack: EmptyBlock?
    
    /// Представление, которое отображает основную информацию о маршруте
    @IBOutlet weak var detailView: RNSRouteDetailView!
    
    @IBOutlet weak var blackButton: RNSBlackButton!
    
    /// Создание контроллера с помощью объекта маршрута
    ///
    /// - Parameter item: объект с информацией о маршруте
    static func initController(_ item: RNSRouteVariant?) -> RNSRouteDetailController?  {
        let vc = RNSRouteDetailController.initialControllerType()
        vc?.item = item
        return vc
    }
    
    override func viewDidLoad() {
        super.viewDidLoad()
        
        updateData()
    }
    
    /// Обновление данных в представлениях
    func updateData() {
        prepareDetailView()
        prepareFlagView()
    }
    
    /// Настройка представления с детальной информацией
    func prepareDetailView() {
        detailView.item = item?.tableItem
    }
    
    override class var storyboardName: String {
        return "RNSRouteDetailController"
    }
    
    deinit {
        print("RNSRouteDetailViewController deinit")
    }
    
    /// Событие нажатия на кнопку возврата к предыдущему контроллеру
    @IBAction func actionBack(_ sender: Any) {
        handlerBack?()
    }
}
