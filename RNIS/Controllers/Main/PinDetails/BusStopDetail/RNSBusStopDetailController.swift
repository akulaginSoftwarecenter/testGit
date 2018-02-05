//
//  RNSBusStopDetailController.swift
//  RNIS
//
//  Created by Артем Кулагин on 07.08.17.
//  Copyright © 2017 Артем Кулагин. All rights reserved.
//

import UIKit

/**
 Контроллер отображения списка автобусов, которые останавливаются на выбранной остановке
 */
class RNSBusStopDetailController: RNSParentDetailPinController {
    
    /// Ограничение высоты таблицы
    @IBOutlet weak var heightTableView: NSLayoutConstraint!
    /// Таблица автобусных остановок
    @IBOutlet weak var tableView: UITableView!
    
    /// Создание контроллера
    ///
    /// - Parameter item: модель автобусной остановки
    static func initController(_ item: RNSBusStop?) -> UIViewController? {
        let vc = RNSBusStopDetailController.initialControllerType()
        vc?.item = item
        let container = STRouter.scrollShowContainer(vc, topTitle: item?.name)
        container?.handlerRect = vc?.prepareViews(_:)
        container?.handlerDismiss = RNSMapManager.handlerDismissOldPresentVC
        vc?.startBottomOffset = container?.startBottomOffset
        return  container
    }
   
    /// Модель автобусной остановки
    var item: RNSBusStop?
    /// Массив моделей автобусных маршрутов
    var items: [RNSBusRouteTemp]?
    /// Представление индикации загрузки
    
    /// Ограничение расстояния между таблицей и верхней стороной представления контроллера
    @IBOutlet weak var topConstraint: NSLayoutConstraint!
    /// Надпись, отображающая адрес название выбранной остановки
    @IBOutlet weak var titleLabel: UILabel!
    @IBOutlet weak var titleStop: UILabel!
    @IBOutlet weak var timerlabel: UILabel!
    /// Кнопка "сообщить об ошибке"
    @IBOutlet weak var errorReportButton: RNSBlackButton!
    
    lazy var loaderView = RNSLoaderWay()
    lazy var loaderViewTwo = LoaderView()
    
    /// Начальная высота контроллера
    var startBottomOffset: CGFloat?
    
    override func viewDidLoad() {
        super.viewDidLoad()
        
        prepareReportButton()
        prepareTitle()
        loadItems()
        prepareHandlers()
    }
    
    func prepareHandlers() {
        RNSMapManager.handlerStopDetailUpdate = {[weak self] in
            self?.loadItems(true)
        }
    }
    
    /// Настройка кнопки "сообщить об ошибке"
    private func prepareReportButton() {
        errorReportButton.button.touchUpInside {
            let vc = SupportItemViewController.controllerType()
            vc?.type = .feedback
            vc?.titleName = "Остановка"
            vc?.nameText = self.item?.name
            vc?.uuid = self.item?.uuid
            vc?.pushAnimatedRedScroll()
        }
    }
    
    override func prepareCurrent(_ value: Bool) {
        RNSBusStopManager.prepareCurrentItem(value, item: item)
    }
}
