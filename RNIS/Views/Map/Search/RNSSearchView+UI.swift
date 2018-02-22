//
//  RNSSearchView+UI.swift
//  RNIS
//
//  Created by Артем Кулагин on 23.11.2017.
//  Copyright © 2017 Артем Кулагин. All rights reserved.
//

import Foundation

extension RNSSearchView {
    
    /// Метод очистки ошибок
    func clearError() {
        prepareError(nil)
    }
    
    func  prepareError(_ error: String?) {
        handlerError?(error)
    }
    
    func showLoader() {
        handlerLoader?(true)
    }
    
    func removeLoader(){
        handlerLoader?(false)
    }
    
    func prepareClearError(_ error: String?) {
        prepareError(error)
        clearTable()
        removeLoader()
    }
}
