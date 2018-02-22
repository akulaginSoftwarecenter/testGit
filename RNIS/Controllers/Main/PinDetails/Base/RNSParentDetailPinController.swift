//
//  RNSParentDetailPinController.swift
//  RNIS
//
//  Created by Артем Кулагин on 21.11.2017.
//  Copyright © 2017 Артем Кулагин. All rights reserved.
//

import UIKit

/**
 Класс родительского контроллера для отображения информации по пинам
 */
class RNSParentDetailPinController: UIViewController {
    override func viewDidAppear(_ animated: Bool) {
        super.viewDidAppear(animated)
        
        prepareCurrent(true)
    }
    
    override func viewWillDisappear(_ animated: Bool) {
        super.viewWillDisappear(animated)
        
        prepareCurrent(false)
    }
     
    func prepareCurrent(_ value: Bool) {
        
    }
}
