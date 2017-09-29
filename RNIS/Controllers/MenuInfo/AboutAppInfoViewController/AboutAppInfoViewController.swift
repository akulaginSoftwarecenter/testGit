//
//  AboutAppInfoViewController.swift
//  menuInfo
//
//  Created by Ilya Inyushin on 30.08.17.
//  Copyright © 2017 Ilya Inyushin. All rights reserved.
//

import UIKit

class AboutAppInfoViewController: UIViewController {

    @IBOutlet weak var appVersionLabel: UILabel!

    override func viewDidLoad() {
        super.viewDidLoad()
        if let version = Bundle.main.object(forInfoDictionaryKey: "CFBundleShortVersionString"), let bundle = Bundle.main.object(forInfoDictionaryKey: "CFBundleVersion") {
            appVersionLabel.text = "Версия : \(version).\(bundle)"
        }
    }
    
    override class var storyboardName: String {
        return "AboutAppInfoViewController"
    }
}
