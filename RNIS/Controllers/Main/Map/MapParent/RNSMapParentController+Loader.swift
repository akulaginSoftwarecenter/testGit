//
//  RNSMapParentController+Loader.swift
//  RNIS
//
//  Created by Артем Кулагин on 09.11.17.
//  Copyright © 2017 Артем Кулагин. All rights reserved.
//

import Foundation

extension RNSMapParentController {
    
    /// Показать индикацию загрузки
    func showLoader(_ text: String?) {
        loaderView.showInView(self.view)
        prepareTextLoader(text)
    }
    
    func showLoaderLostInet() {
        showLoader("Соединение с сервером...")
    }
    
    func prepareTextLoader(_ text: String?) {
        loaderView.prepareText(text)
    }
    
    /// Убрать индикацию загрузки
    func removeLoader() {
        loaderView.remove()
    }
    
    func updateLoader() {
        if RNSBusStopManager.showLoader {
            showLoader("Обновление остановок...")
            return
        }
        if RNSBusManager.showLoader {
            showLoader("Обновление автобусов...")
            return
        }
        removeLoader()
    }
}
