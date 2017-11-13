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
class RNSBusStopDetailController: UIViewController {
    
    /// Ограничение высоты таблицы
    @IBOutlet weak var heightTableView: NSLayoutConstraint!
    /// Таблица автобусных остановок
    @IBOutlet weak var tableView: UITableView!
    
    /// Создание контроллера
    ///
    /// - Parameter item: модель автобусной остановки
    static func initController(_ item: RNSBusStop?) -> UIViewController? {
        let vc = RNSBusStopDetailController.initialController as? RNSBusStopDetailController
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
    }
    
    /// Настройка кнопки "сообщить об ошибке"
    private func prepareReportButton() {
        errorReportButton.button.touchUpInside {
            let vc = SupportInfoViewController.initialController as? SupportInfoViewController
            vc?.type = .feedback
            if let item = self.item {
                vc?.message = "Остановка \(item.name), id \(item.uuid). Сообщение: \n"
            }
            vc?.pushAnimatedRedScroll()
        }
    }
    
    override func viewDidAppear(_ animated: Bool) {
        super.viewDidAppear(animated)
        
        prepareCurrent(true)
    }
    
    override func viewWillDisappear(_ animated: Bool) {
        super.viewWillDisappear(animated)

        prepareCurrent(false)
    }
    
    override class var storyboardName: String {
        return "RNSBusStopDetailController"
    }
    
    deinit {
        print("RNSBusStopDetailController deinit")
    }
    
    func prepareCurrent(_ value: Bool) {
        RNSBusStopManager.prepareCurrentStop(value, item: item)
    }
}
