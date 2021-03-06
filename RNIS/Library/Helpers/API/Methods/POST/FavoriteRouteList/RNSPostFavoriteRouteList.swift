//
//  RNSPostFavoriteRouteList.swift
//  RNIS
//
//  Created by Артем Кулагин on 28.09.17.
//  Copyright © 2017 Артем Кулагин. All rights reserved.
//

import UIKit

/**
 Запрос списка избраных маршрутов
 */
class RNSPostFavoriteRouteList: RNSPostRequestMobileToken {
    /*
    override var isShowLogReply: Bool {
        return false
    }
    */
    typealias AliasReply = RNSRequestReply<RNSFavoriteRouteListPayload,RNSRegisterError>
    
    override func apiDidReturnReply(_ reply: AnyObject, source: AnyObject){
          parseReply(AliasReply(reply: reply), source: source)
    }
    
    func parseReply(_ model: AliasReply?, source: AnyObject) {
        if  model?.success ?? false {
            super.apiDidReturnReply(model?.payload?.stop_points as AnyObject, source: source)
            return
        }
        parseError(model, source: source)
    }
    
    /// Метод расчета отображения ошибки
    func parseError(_ model: AliasReply?, source: AnyObject) {
        guard let item = model?.errors?.first else {
            return
        }
        super.apiDidFailWithError(item.error)
    }
    
    override func showErrorNetwork() {
        
    }
    
    override var subject: String {
        return "com.rnis.mobile.action.favorite_route.list"
    }
}
