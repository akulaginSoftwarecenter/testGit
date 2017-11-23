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
        let vc = RNSAddressViewController.controller as? RNSAddressViewController
        vc?.item = item
        vc?.type = type
        vc?.complete = complete
        return vc
    }
    
    lazy var loaderView = LoaderView.loaderInteractionEnabled
    
    var viewBottomHeightLayoutConstraint: NSLayoutConstraint? {
        get {
            return bottomTableView
        }
    }
    
    var isNeedAddTap: Bool {
        return false
    }
    
    var request: RNSGetGeoCode?
    
    var type: TypeAddress?
    var item: RNSDutyAddressTemp?
    var complete: AliasAddressComplete?
    /// Внутренний контроллер
    var containerController: RNSMapParentController?
    
    /// Пин, который будет установлен на карте для демонстрации положения адреса на карте
    var pin: RNSPinAddress?
    
    /// Кнопка "показать меня на карте"
    @IBOutlet weak var buttonMyLocation: UIButton!
    /// Поле ввода адреса
    @IBOutlet weak var textField: UITextField!
    /// Заголовок контроллера
    @IBOutlet weak var titleLabel: RNSTopTitle!
    
    /// Ограничение таблицы снизу
    @IBOutlet weak var bottomTableView: NSLayoutConstraint!
    /// Ограничение высоты таблицы

    /// Таблица вариантов адресов (автокомплит)
    @IBOutlet weak var containerTables: UIView!
    
    lazy var tableHistory: RNSAddressHistoryView = {
        let view = RNSAddressHistoryView()
        if let parentView = self.containerTables {
            parentView.addSubview(view)
            view.snp.makeConstraints{
                $0.edges.equalTo(parentView)
            }
        }
        view.handlerAddress = {[weak self] item in
            self?.prepareAddress(item)
            self?.endEdit()
        }
        return view
    }()
    
    override func viewDidLoad() {
        super.viewDidLoad()
        
        prepareTextField()
        prepareType()
    }
    
    override class var storyboardName: String {
        return "RNSMapParentController"
    }
    
    override func viewWillAppear(_ animated: Bool) {
        super.viewWillAppear(animated)
        addKeyboardObservers()
    }
    
    override func viewWillDisappear(_ animated: Bool) {
        super.viewWillDisappear(animated)
        removeAllObservers()
        removePin()
    }
}
