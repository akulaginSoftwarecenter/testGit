//
//  RNSProfileViewController+Logout.swift
//  RNIS
//
//  Created by Артем Кулагин on 24.08.17.
//  Copyright © 2017 Артем Кулагин. All rights reserved.
//

import Foundation

extension RNSProfileViewController {
    
    func showAlert() {
        STRouter.showAlertBtns("Выйти из аккаунта?") {
            RNISAuthManager.logout()
        }
    }
}
