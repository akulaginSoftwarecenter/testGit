//
//  AboutAppInfoViewController.swift
//  menuInfo
//
//  Created by Ilya Inyushin on 30.08.17.
//  Copyright © 2017 Ilya Inyushin. All rights reserved.
//

import UIKit

/**
 Контроллер для отображения информации о приложении
 */
class AboutAppInfoViewController: UIViewController {

    /// Надпись с версией приложения
    @IBOutlet weak var appVersionLabel: UILabel!

    /// Метод инициализации класса
    override func viewDidLoad() {
        super.viewDidLoad()
        if let version = Bundle.main.object(forInfoDictionaryKey: "CFBundleShortVersionString"), let bundle = Bundle.main.object(forInfoDictionaryKey: "CFBundleVersion") {
            appVersionLabel.text = "Версия : \(version).\(bundle)"
        }
    }
}
