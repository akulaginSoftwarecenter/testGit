//
//  RNSBusInfoViewController.swift
//  RNIS
//
//  Created by Артем Кулагин on 11.08.17.
//  Copyright © 2017 Артем Кулагин. All rights reserved.
//

import UIKit

/**
 Конроллер показывает основную информацию об автобусе
 */
class RNSBusInfoViewController: UIViewController {
    fileprivate let smallScreenHeightThreshold: CGFloat = 600
    fileprivate let smallScreenTopConstraint: CGFloat = 135


    /// Создание контроллера
    ///
    /// - Parameter item: серверная модель автобуса
    static func initController(_ item: RNSBusTemp?) -> UIViewController? {
        let vc = RNSBusInfoViewController.initialControllerType()
        vc?.item = item
        return  vc
    }
    
    /// Серверная модель автобуса
    var item: RNSBusTemp?
    
    /// Ограничение расстояния между первым текстовым полем и верхней стороной представления контроллера
    @IBOutlet weak var topDistanceConstraint: NSLayoutConstraint!
    /// Поле с информацией о водителе
    @IBOutlet weak var driverField: RNSNameFieldLeft!
    /// Поле с информацией о кондукторе
    @IBOutlet weak var conductorField: RNSNameFieldLeft!
    /// Поле с информацией о депо
    @IBOutlet weak var depoField: RNSNameFieldLeft!
    /// Поле с информацией о транспортной компании
    @IBOutlet weak var carrierField: RNSNameFieldLeft!
    /// Поле с номером телефона компании
    @IBOutlet weak var phoneField: RNSNameFieldLeft!
    /// Кнопка "пожаловаться"
    @IBOutlet weak var complainButton: RNSBlackButton!
    
    @IBOutlet weak var titleAdd: UILabel!
    @IBOutlet weak var descriptionAdd: UILabel!
    
    
    override func viewDidLoad() {
        super.viewDidLoad()
        /*
        if UIScreen.height < smallScreenHeightThreshold {
            topDistanceConstraint.constant = smallScreenTopConstraint
        }
        */
        prepareUI()
    }
    
    /// Настройка представлений
    func prepareUI() {
        driverField.text = item?.driver
        conductorField.text = item?.check_taker
        depoField.text = item?.unit_name
        carrierField.text = item?.carrier_name
        phoneField.text = item?.unit_phone
        complainButton.button.touchUpInside {
            let vc = SupportItemViewController.controllerType()
            vc?.type = .complaint
            vc?.titleName = "Транспорт"
            vc?.nameText = self.item?.route_number
            vc?.uuid = self.item?.uuid
            vc?.pushAnimatedRedScroll()
        }
        prepareAdditionally()
    }
    
    func prepareAdditionally() {
        var isHideAdditionally = true
        var text = String()
        if item?.has_air_conditioning ?? false {
            isHideAdditionally = false
            text = "- Присутствует кондиционер \n"
        }
        if item?.has_cashless_payment ?? false {
            isHideAdditionally = false
            text += "- Возможна оплата безналичным расчетом"
        }
        titleAdd.isHidden = isHideAdditionally
        descriptionAdd.isHidden = isHideAdditionally
        descriptionAdd.text = text
    }
    
    override class var storyboardName: String {
        return "RNSBusInfoViewController"
    }
}
