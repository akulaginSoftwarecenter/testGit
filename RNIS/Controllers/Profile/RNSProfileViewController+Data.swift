//
//  RNSProfileViewController+Data.swift
//  RNIS
//
//  Created by Артем Кулагин on 07.11.17.
//  Copyright © 2017 Артем Кулагин. All rights reserved.
//

import Foundation

/**
 Расширение для работы с данными
 */
extension RNSProfileViewController {
    
    /// Загрузка данных профиля пользователя
    func loadData() {
        STRouter.showLoader()
        RNSPostUserGet {[weak self] (reply, error, _) in
            self?.updateUI(reply as? RNSUserPayload)
            self?.checkShowBtn()
            STRouter.removeLoader()
        }
    }
    
    /// Отправка на сервер изменений в модели профиля
    ///
    /// - Parameter complete: блок завершения операции отправки
    func updateItem(email: String? = nil, _ complete: EmptyBlock? = nil) {
        STRouter.showLoader()
        item?.new_email = email  // Remove new_email from update profile payload
        item?.new_phone = nil
        item?.prepareProfile()
        RNSPostUpdate(item, complete: { item in
            STRouter.removeLoader()
            RNSMenuManager.leftMenuUpdate()
            complete?()
            }, failure: {[weak self]  error in
                STRouter.removeLoader()
                self?.showAlertOk(error)
        })
    }
}
