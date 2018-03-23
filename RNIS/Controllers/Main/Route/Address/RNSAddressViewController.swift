//
//  RNSAddressViewController.swift
//  RNIS
//
//  Created by Артем Кулагин on 16.08.17.
//  Copyright © 2017 Артем Кулагин. All rights reserved.
//

import UIKit

/// Перечисление типов адреса
///
/// - fromAddress: адрес "откуда"
/// - inAddress: адрес "куда"
enum TypeAddress: String {
    case fromAddress = "Откуда", inAddress = "Куда"
}

/**
 Базовый контроллер для ввода и оображения адреса на карте
 */
class RNSAddressViewController: UIViewController, KeyboardShowable {
    
    /// Создание контроллера
    ///
    /// - Parameters:
    ///   - item: объект, которые содержит данные об адресе и географическом местоположении
    ///   - type: тип адреса
    ///   - complete: блок, который выполнится непосредственно перед выходом из контроллера
    static func initController(_ item: RNSDutyAddressTemp?, type: TypeAddress?, complete: AliasAddressComplete?) -> UIViewController?  {
        let vc = RNSAddressViewController.controllerType()
        vc?.item = item
        vc?.type = type
        vc?.complete = complete
        return vc
    }
    
    /// Представление индикации загрузки
    lazy var loaderView = LoaderView.interactionEnabled
    
    /// переменная высоты нижнего констрейнта
    var viewBottomHeightLayoutConstraint: NSLayoutConstraint? {
        get {
            return bottomTableView
        }
    }
    
    /// переменная для проверки добавления тапа на вью если нужно
    var isNeedAddTap: Bool {
        return false
    }
    
    /// переменная сохранения запроса RNSGetGeoCode
    var request: RNSGetGeoCode?
    /// переменная тип поиска адреса
    var type: TypeAddress?
    /// главная переменная инициализации
    var item: RNSDutyAddressTemp?
    var complete: AliasAddressComplete?
    /// Внутренний контроллер
    var containerController: RNSMapParentController?
    
    /// Пин, который будет установлен на карте для демонстрации положения адреса на карте
    var pin: RNSPinAddress?
    
    /// точка инициализации
    var point: PGGeoPoint?
    
    /// Кнопка "показать меня на карте"
    @IBOutlet weak var buttonMyLocation: UIButton!
    /// Правый констрейнт текстового поля
    @IBOutlet weak var rightTextFildConstraint: NSLayoutConstraint!
    /// Левый констрейнт текстового поля
    @IBOutlet weak var leftTextFieldConstraint: NSLayoutConstraint!
    /// Поле ввода адреса
    @IBOutlet weak var textField: UITextField!
    /// Заголовок контроллера
    @IBOutlet weak var titleLabel: RNSTopTitle!
    
    /// Ограничение таблицы снизу
    @IBOutlet weak var bottomTableView: NSLayoutConstraint!
    /// Ограничение высоты таблицы

    /// Таблица вариантов адресов (автокомплит)
    @IBOutlet weak var containerTables: UIView!
    /// Левый оступ текстового поля
    let leftTextField: CGFloat = 15
    
    /// Таблица истории поиска
    lazy var tableHistory: RNSAddressHistoryView = {
        let view = RNSAddressHistoryView()
        if let parentView = self.containerTables {
            parentView.addSubview(view)
            view.snp.makeConstraints{
                $0.edges.equalTo(parentView)
            }
        }
        view.isHidden = true
        view.handlerItem = {[weak self] item in
            self?.prepareAddressContainers(item?.title)
            self?.addPinMapCenter(item?.point)
        }
        return view
    }()
    /// Таблица адресов поиска
    lazy var tableAddress: RNSSearchView = {
        let view = RNSSearchView()
        let leftEdge: CGFloat = 15
        if let parentView = self.containerTables {
            parentView.addSubview(view)
            view.snp.makeConstraints{
                $0.right.top.bottom.equalTo(parentView)
                $0.left.equalTo(parentView).inset(leftEdge)
            }
        }
        view.widthCell = UIScreen.width - leftEdge
        view.isHidden = true
        view.handlerLoader = {[weak self] value in
            if value {
                self?.showLoader()
            } else {
                self?.removeLoader()
            }
        }
        
        view.handlerShowItem = {[weak self] value in
            self?.prepareItemContainers(value as? RNSAddressTemp)
        }
        return view
    }()
    
    /// Метод инициализации класса
    override func viewDidLoad() {
        super.viewDidLoad()
        
        prepareTextField()
        prepareType()
        prepareItem()
    }
    /// Переменная имени сториборда инициализации вьюконтроллера
    override class var storyboardName: String {
        return "RNSMapParentController"
    }
    
    /// метод обработки появления контроллера
    override func viewWillAppear(_ animated: Bool) {
        super.viewWillAppear(animated)
        addKeyboardObservers()
    }
    
    /// метод обработки исчезновения контроллера
    override func viewWillDisappear(_ animated: Bool) {
        super.viewWillDisappear(animated)
        removeAllObservers()
        removePin()
    }
}
