//
//  RNSMapViewController+Action.swift
//  RNIS
//
//  Created by Артем Кулагин on 18.07.17.
//  Copyright © 2017 Артем Кулагин. All rights reserved.
//

import Foundation
/**
 Расширение для работы тапами по кнопкам
 */
extension RNSMapViewController {
    
    /// Событие нажатия на кнопку демонстрации маршрута
    @IBAction func actionRoute(_ sender: Any) {
        RNSDutyViewController.initialPushAnimatedRedScroll()
    }
}
