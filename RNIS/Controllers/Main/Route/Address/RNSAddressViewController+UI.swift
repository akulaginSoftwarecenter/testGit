//
//  RNSAddressViewController+Container.swift
//  RNIS
//
//  Created by Артем Кулагин on 23.11.2017.
//  Copyright © 2017 Артем Кулагин. All rights reserved.
//

import Foundation

extension RNSAddressViewController {
    
    override func prepare(for segue: UIStoryboardSegue, sender: Any?) {
        containerController = segue.destination as? RNSMapParentController
        prepareEnterViewController()
    }
    
    /// Настройка внутреннего контроллера
    func prepareEnterViewController(){
        containerController?.handlerOnMapTouchEvent = {[weak self] point in
            self?.onMapTouchEvent(point)
        }
        
        containerController?.handlerOnMapLongTouchEvent = {[weak self] point in
            self?.onMapLongTouchEvent(point)
        }
        
        containerController?.handlerOnOverlay = {[weak self] point,item in
            self?.onOverlay(point, item: item)
        }
    }
    
    /// Настройка заголовка контроллера
    func prepareType() {
        let type = self.type ?? .fromAddress
        titleLabel.text = type.rawValue
    }
    
    func showLoader() {
        loaderView.showInView(view)
    }
    
    func removeLoader() {
        loaderView.remove()
    }
}
