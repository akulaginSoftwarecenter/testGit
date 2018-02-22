//
//  STRouter+Loader.swift
//  Spytricks
//
//  Created by Артем Кулагин on 06.04.17.
//  Copyright © 2017 Ivan Alekseev. All rights reserved.
//

import UIKit
import SVProgressHUD

/**
 Расширение для работы с лоадером
 */
extension STRouter {
    
    static func showLoader() {
        SVProgressHUD.setDefaultMaskType(.clear)
        SVProgressHUD.show()
    }
    
    static func showLoaderEnableUserInteraction() {
        SVProgressHUD.show()
    }
    
    /// Убрать индикацию загрузки
    static func removeLoader() {
        SVProgressHUD.dismiss()
    }
}
