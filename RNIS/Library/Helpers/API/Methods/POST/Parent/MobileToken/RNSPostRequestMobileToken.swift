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
    
    var countAttemptUpdateToken = 0
    var enableSendToken = true
    
    override var headers: AliasDictionary {
        var headers = super.headers
        if enableSendToken {
            headers = headers.merged(with: Utils.mobileToken)
        }
        return headers
    }
    
    override var method: Alamofire.HTTPMethod {
        return .post
    }
    
    override func sendRequest() {
        if UserDefaults.isHaveToken {
            super.sendRequest()
        } else {
            updateTokenAndRepeatRequest()
        }
    }
    
    func updateTokenAndRepeatRequest() {
        updateToken{
            super.sendRequest()
        }
    }
    
    func updateToken(complete: EmptyBlock?) {
        printLog("Получаем временный токен")
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
    
    override func parseResponseJson(_ json: AnyObject) {
        printLog("проверяем на наличие ошибок")
        printLog("countAttemptUpdateToken " + "\(countAttemptUpdateToken)")
        guard countAttemptUpdateToken < 3 else {
            super.parseResponseJson(json)
            showOk("Превышен лимит попыток обновления токена")
            return
        }
        
        countAttemptUpdateToken += 1
        let model = AliasPostRegister(reply: json)
        guard model?.errors?.first?.isBadToken ?? false else {
            super.parseResponseJson(json)
            printLog("Нет ошибок")
 
            return
        }
        printLog("Перегружаем токен")
        UserDefaults.removeUserData()
        updateTokenAndRepeatRequest()
    }
    
    func printLog(_ log: String){
        if showLogUpdateToken {
            print(log);
        }
    }
}
