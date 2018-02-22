//
//  RNSShowView.swift
//  RNIS
//
//  Created by Артем Кулагин on 08.08.17.
//  Copyright © 2017 Артем Кулагин. All rights reserved.
//

import UIKit

/**
 Класс тап вью
 */
class RNSTouchView: UIView {

    var rect: CGRect?
    
    override func point(inside point: CGPoint, with event: UIEvent?) -> Bool {
        guard let rect = rect else {
            return false
        }
        let touchInView = rect.contains(point)
        return touchInView
    }
}
