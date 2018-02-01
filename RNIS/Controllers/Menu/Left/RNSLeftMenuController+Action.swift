//
//  RNSLeftMenuController+Action.swift
//  RNIS
//
//  Created by Артем Кулагин on 01.09.17.
//  Copyright © 2017 Артем Кулагин. All rights reserved.
//

import Foundation

/// Расширение для обработки нажатия некоторых кнопок
extension RNSLeftMenuController {
    
    /// Нажатие кнопки редактирование профиля
    @IBAction func actionProfile(_ sender: Any) {
        if isHaveEmail {
            RNSMenuManager.showProfile()
        } else {
            STRouter.showLogin()
        }
    }
    
    @IBAction func testAction(_ sender: Any) {
        RNSBusStopManager.prepareStubAsunc()
    }
    
    @IBAction func testBuss(_ sender: Any) {
        RNSBusManager.prepareStubAsunc()
    }
     
    /// Нажатие кнопки "опубликовать в соцсетях"
    ///
    /// - Parameter sender: <#sender description#>
    @IBAction func actionShare(_ sender: Any) {
        let text = "Рекомендую приложение «Остановки МО» для построения маршрута на транспорте.\nДоступно в Google Play и App Store."
        let vc = UIActivityViewController(activityItems: [text], applicationActivities: [])
        if vc.responds(to: #selector(getter: UIActivityViewController.popoverPresentationController)) {
            vc.popoverPresentationController?.sourceView = self.view
        }
        vc.excludedActivityTypes = [.postToFacebook,.postToTwitter,.assignToContact]
        STRouter.present(vc)
    }
      
    @IBAction func actionStart(_ sender: Any) {
        //RNSMoveStub.start()
        //UserDefaults.setToken("sdfdsf")
        RNSMapManager.showRabanc(nil)
    }
    
    @IBAction func actionEnd(_ sender: Any) {
        RNSMoveStub.end()
    }
}
