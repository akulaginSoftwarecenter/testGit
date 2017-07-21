//
//  STRouter+Loader.swift
//  Spytricks
//
//  Created by Артем Кулагин on 06.04.17.
//  Copyright © 2017 Ivan Alekseev. All rights reserved.
//

import UIKit
import SVProgressHUD

extension STRouter {
    
    static func showLoader() {
        SVProgressHUD.show()
    }
    
    static func removeLoader() {
        SVProgressHUD.dismiss()
    }
}
