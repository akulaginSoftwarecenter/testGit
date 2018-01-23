//
//  RNSChangeEmailController.swift
//  RNIS
//
//  Created by Артем Кулагин on 17.01.2018.
//  Copyright © 2018 Артем Кулагин. All rights reserved.
//

import UIKit

class RNSChangeEmailController: RNSEmailContainerController {
    override var typeTitle: TypeTitle {
        return .changeEmail
    }
    
    override var placeHolderEmailField: String? {
        return "Новая почта"
    }
    
    override var titleBackButton: String? {
        return "Назад"
    }
    
    /// Данные профиля пользователя
    var item: RNSUserPayload?
    
    override func viewDidLoad() {
        super.viewDidLoad()
        
        loadData()
    }
    
    /// Загрузка профиля пользователя
    func loadData() {
        STRouter.showLoader()
        RNSPostUserGet {[weak self] (reply, error, _) in
            self?.item = reply as? RNSUserPayload
            STRouter.removeLoader()
        }
    }
    
    /// Отправка нового телефона на сервер
    override func actionNext() {
        item?.new_phone = nil
        item?.new_email = emailText  // Don't re-send new email parameter on next update profile request
        RNSPostUpdate(item, complete: {
            STRouter.pushMain(RNSChangeCodeEmailController.initController($0))
        }, failure: { [weak self] error in
            self?.prepareError(error)
        })
    }
    
    override func prepareError(_ error: String?) {
        containerViewController?.errorLabel.text = error
    }
}
