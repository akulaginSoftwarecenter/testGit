//
//  RNSBusDetailTotalView.swift
//  RNIS
//
//  Created by Артем Кулагин on 10.08.17.
//  Copyright © 2017 Артем Кулагин. All rights reserved.
//

import UIKit

/**
 Представление для отображения детально информации об автобусе
 */
class RNSBusDetailTotalView: BaseViewWithXIBInit {
    
    /// Модель автобуса
    var item: RNSBusTemp?{
        didSet{
            updateUI()
        }
    }
    
    /// Представление рисунка показывающего наличие кондиционера
    @IBOutlet weak var conditioningImage: UIImageView!
    /// Представление рисунка показывающего возможность оплаты картой
    @IBOutlet weak var paymentImage: UIImageView!
    /// Надпись заголовка
    @IBOutlet weak var titleLabel: UILabel!
    /// Надпись описания начальной точки маршрута
    @IBOutlet weak var startLabel: UILabel!
    /// Надпись описания текущей точки маршрута
    @IBOutlet weak var currentLabel: UILabel!
    /// Надпись описания конечной точки маршрута
    @IBOutlet weak var endLabel: UILabel!
    
    /// Обновление представлений
    func updateUI() {
        titleLabel.text =  item?.route_number
        let stops = item?.stop_points
        startLabel.text = stops?.first?.name
        currentLabel.text = item?.next_stop_point?.name
        endLabel.text = stops?.last?.name
        
        conditioningImage.isHidden = !(item?.has_air_conditioning ?? false)
        paymentImage.isHidden = !(item?.has_cashless_payment ?? false)
    }
}
