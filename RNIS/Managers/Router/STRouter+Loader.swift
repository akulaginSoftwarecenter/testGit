//
//  STRouter+Loader.swift
//  Spytricks
//
//  Created by Артем Кулагин on 06.04.17.
//  Copyright © 2017 Ivan Alekseev. All rights reserved.
//

import UIKit

extension STRouter {
    
    static func showLoader() {
        if let view = rootViewController?.view {
            loaderView.showInView(view)
        }
    }
    
    static func removeLoader() {
        loaderView.remove()
    }
}
