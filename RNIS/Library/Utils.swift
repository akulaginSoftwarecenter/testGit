//
//  Utils.swift
//  Spytricks
//
//  Created by Артем Кулагин on 09.02.17.
//  Copyright © 2017 Ivan Alekseev. All rights reserved.
//

import Foundation
import UIKit
import Alamofire

typealias EmptyBlock = () -> Void
typealias AliasDictionary = [String: Any]
typealias AnyBlock = (Any) -> ()
typealias AnyItemsBlock = ([Any]) -> ()
typealias AliasImageBlock = (UIImage?) -> ()
typealias AliasImagePickerBlock = (UIImagePickerControllerSourceType) -> ()
typealias AliasThrowsBlock = () throws -> Void
typealias AliasRangeBlock = (RNSRangeScroll) -> ()
typealias AliasRectBlock = (CGRect) -> ()
typealias AliasPointBlock = (PGGeoPoint) -> ()
typealias AliasOverlayBlock = (PGOverlay) -> ()
typealias AliasStringBlock = (String?) -> ()
typealias AliasStringArrayBlock = ([String]?) -> ()
typealias AliasBoolBlock = (Bool) -> ()
typealias AliasRegisterPayloadBlock = (RNSUserPayload?) -> ()
typealias AliasPostRegister = RNSRequestReply<RNSUserPayload,RNSRegisterError>
typealias AliasAddressComplete = ((RNSDutyAddressTemp?) ->())
typealias AliasPair = (first: RNSRoutePoint?, last: RNSRoutePoint?)
typealias AliasBlockImage = (UIImage) -> ()

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
    
    static func queueUserInitiated(handler: EmptyBlock?) {
        queueGlobal(.userInitiated, handler: handler)
    }
    
    static func queueUserBackground(handler: EmptyBlock?) {
        queueGlobal(.background, handler: handler)
    }
    
    static func queueGlobal(_ qos: DispatchQoS.QoSClass = DispatchQoS.QoSClass.default, handler: EmptyBlock?) {
        DispatchQueue.global(qos: qos).async {
            handler?()
        }
    }

    static var mobileToken: AliasDictionary {
        var dict = AliasDictionary()
        if let token = UserDefaults.token {
            dict["mobile_token"] = "\(token)"
        }
        return dict
    }
    
    static var isHaveToken: Bool {
        return UserDefaults.isHaveToken
    }
    
    static func checkTokeShowAlert() {
        if !isHaveToken {
            STAlertRouter.showAlertRegistration()
        }
    }
    
    static func dictToJson(_ name: String?) -> Any? {
        if let path = Bundle.main.url(forResource: name, withExtension: "json") {
            do {
                let data = try Data(contentsOf: path, options: .alwaysMapped)
                do {
                    return try JSONSerialization.jsonObject(with: data, options: [])
                } catch {
                    print(error.localizedDescription)
                }
            } catch let error {
                print(error.localizedDescription)
            }
        }
        return nil
    }
    
    static func loadImage(url: String?, compelete: AliasBlockImage? ) {
        guard let url = url else {
            return
        }
        Alamofire.request(url).response { response in
            if let data = response.data,
                let image = UIImage(data: data) {
                compelete?(image)
            }
        }
    }
}
