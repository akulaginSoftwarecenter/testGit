//
//  RNSArrowLeft.swift
//  RNIS
//
//  Created by Артем Кулагин on 22.08.17.
//  Copyright © 2017 Артем Кулагин. All rights reserved.
//

import UIKit

/**
 Представление стрелки
 */
class RNSArrowLeft: UIImageView {
    
    /// Создание представления
    ///
    /// - Parameter doneMove: параметр указывает выполнен ли сдвиг
    convenience init(_ doneMove: Bool?) {
        let image = (doneMove ?? false) ?#imageLiteral(resourceName: "ArrowLeftDone") : #imageLiteral(resourceName: "ArrowLeft")
        self.init(image: image)
        contentMode = .right
        clipsToBounds = true
    }
}
