//
//  SettingsViewController.swift
//  menuInfo
//
//  Created by Ilya Inyushin on 30.08.17.
//  Copyright © 2017 Ilya Inyushin. All rights reserved.
//

import UIKit

/**
 Контроллер настроек
 */
class SettingsViewController: UIViewController {

    /// Представление, которое включает или отключает наличие на карте кнопок зума
    @IBOutlet weak var zoomButtonMap: UISwitch!

    override func viewDidLoad() {
        super.viewDidLoad()
        zoomButtonMap.isOn = !UserDefaults.hideZoomButtonInMap
    }

    /// Событие включения/отключения зума
    @IBAction func switchIsChanged(_ sender: Any) {
        UserDefaults.hideZoomButtonInMap = !zoomButtonMap.isOn
    }
}
