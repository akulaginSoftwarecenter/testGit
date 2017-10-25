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
    
    var viewBottomHeightLayoutConstraint: NSLayoutConstraint? {
        get {
            return bottomTableView
        }
    }
    
    var isNeedAddTap: Bool {
        return false
    }
    
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
    @IBOutlet weak var heightTableView: NSLayoutConstraint!
    /// Таблица вариантов адресов (автокомплит)
    @IBOutlet weak var tableView: UITableView!
    
    override func viewDidLoad() {
        super.viewDidLoad()
        
        prepareTextField()
        prepareType()
    }
    
    override func prepare(for segue: UIStoryboardSegue, sender: Any?) {
        containerController = segue.destination as? RNSMapParentController
        prepareEnterViewController()
    }
    
    /// Настройка внутреннего контроллера
    func prepareEnterViewController(){
        containerController?.handlerOnMapTouchEvent = {[weak self] point in
            self?.onMapTouchEvent(point)
        }
        
        containerController?.handlerOnMapLongTouchEvent = {[weak self] point in
            self?.onMapLongTouchEvent(point)
        }
        
        containerController?.handlerOnOverlay = {[weak self] point,item in
            self?.onOverlay(point, item: item)
        }
    }
    
    /// Событие нажатия на кнопку возврата на предыдущий контроллер
    @IBAction func backButton(_ sender: Any) {
        backAction(sender)
        STRouter.pop()
    }
    
    /// Настройка переменной, содержащей данные о расположении
    func updateItem() {
        if item == nil {
            item = RNSDutyAddressTemp()
        }
        item?.address = text
        let point = pin?.overlayItem.geoPoint
        item?.latitude = point?.latitude
        item?.longitude = point?.longitude
    }
    
    /// Настройка заголовка контроллера
    func prepareType() {
        let type = self.type ?? .fromAddress
        titleLabel.text = type.rawValue
    }
    
    override class var storyboardName: String {
        return "RNSMapParentController"
    }
    
    deinit {
        print("RNSAddressViewController deinit")
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
