//
//  RNSPostRequestMobileToken.swift
//  RNIS
//
//  Created by Артем Кулагин on 28.09.17.
//  Copyright © 2017 Артем Кулагин. All rights reserved.
//

import UIKit
import Alamofire

class RNSPostRequestMobileToken: RNSRequest {
    
    override var headers: AliasDictionary {
        return super.headers.merged(with: Utils.mobileToken)
    }
    
    override var method: Alamofire.HTTPMethod {
        return .post
    }
    
    override func sendRequest() {
        if UserDefaults.isHaveToken {
            super.sendRequest()
        } else {
            updateToken{
                super.sendRequest()
            }
        }
    }
    
    func updateToken(complete: EmptyBlock?) {
        print("Получаем временный токен")
        RNSTempRegister(complete: {[weak self] (item) in
            if let token = item?.token {
                UserDefaults.setToken(token)
                complete?()
            } else {
                self?.showOk("Не удалось получить временный токен")
            }
        }, failure: { [weak self] error in
            self?.showOk(error)
        })
    }
    
    func showOk(_ message: String?) {
        STAlertRouter.showOk(message)
    }
}
