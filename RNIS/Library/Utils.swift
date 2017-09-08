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
typealias AliasImageBlock = (UIImage?) -> ()
typealias AliasImagePickerBlock = (UIImagePickerControllerSourceType) -> ()
typealias AliasThrowsBlock = () throws -> Void
typealias AliasRangeBlock = (RNSRangeScroll) -> ()
typealias AliasRectBlock = (CGRect) -> ()
typealias AliasPointBlock = (PGGeoPoint) -> ()
typealias AliasOverlayBlock = (PGOverlay) -> ()
typealias AliasStringBlock = (String?) -> ()
typealias AliasBoolBlock = (Bool) -> ()
typealias AliasRegisterPayloadBlock = (RNSRegisterPayload?) -> ()
typealias AliasPostRegister = RNSRequestReply<RNSRegisterPayload,RNSRegisterError>

func NSLoc(_ key: String?) -> String {
    guard let key = key else {
        return ""
    }
    return NSLocalizedString(key, comment: "")
}

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
    
    static func alpha(_ top: CGFloat, startBottomOffset: CGFloat?) -> CGFloat {
        let halfScreen = UIScreen.halfHeight
        let delta = halfScreen - (startBottomOffset ?? 0)
        let offset = top - halfScreen
        var alpha = offset/delta
        if alpha < 0 {
            alpha = 0
        }
        if alpha > 1 {
            alpha = 1
        }
        return alpha
    }
    
    static func mainQueue(_ handler: @escaping EmptyBlock) {
        DispatchQueue.main.async(execute: handler)
    }
}
