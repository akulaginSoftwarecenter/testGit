//
//  SettingsViewController.swift
//  menuInfo
//
//  Created by Ilya Inyushin on 30.08.17.
//  Copyright © 2017 Ilya Inyushin. All rights reserved.
//

import UIKit

class SettingsViewController: UIViewController {

    @IBOutlet weak var zoomButtonMap: UISwitch!

    override func viewDidLoad() {
        super.viewDidLoad()
        zoomButtonMap.isOn = !UserDefaults.hideZoomButtonInMap
    }

    @IBAction func switchIsChanged(_ sender: Any) {
        UserDefaults.hideZoomButtonInMap = !zoomButtonMap.isOn
    }

    override class var storyboardName: String {
        return "SettingsViewController"
    }
}
