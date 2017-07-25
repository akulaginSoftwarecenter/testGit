//
//  Utils.swift
//  Spytricks
//
//  Created by Артем Кулагин on 09.02.17.
//  Copyright © 2017 Ivan Alekseev. All rights reserved.
//

import Foundation
import UIKit

typealias EmptyBlock = () -> Void
typealias AliasDictionary = [String: Any]
typealias AnyBlock = (Any) -> ()

class Utils {
    
    static func delay(_ delay:Double, closure: EmptyBlock?) {
        let when = DispatchTime.now() + delay
        DispatchQueue.main.asyncAfter(deadline: when, execute: {
            closure?()
        })
    }
    
    static func stringFromSwiftClass(_ swiftClass: AnyClass) -> String {
        return NSStringFromClass(swiftClass).components(separatedBy: ".").last!
    }
}
