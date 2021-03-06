//
//  UIView+Utils.swift
//  RNIS
//
//  Created by Артем Кулагин on 21.07.17.
//  Copyright © 2017 Артем Кулагин. All rights reserved.
//

import Foundation
import SnapKit

/**
 Расширение для UIView
 */
extension UIView {
    
    func addLogo() {
        let view = UIImageView(image: #imageLiteral(resourceName: "Logo"))
        view.contentMode = .scaleAspectFit
        addSubview(view)
        
        view.snp.makeConstraints { (make) in
            _ = make.top.equalTo(self).offset(0)
            _ = make.left.right.equalTo(self).inset(50)
            _ = make.height.equalTo(81).constraint
        }
    }
    
    static func animateConstrains(_ target: UIView?, animations: @escaping () -> Void) {
        guard let target = target else {
            animations()
            return
        }
        target.layoutIfNeeded()
        UIView.animate(withDuration: 0.3, animations: {
            animations()
            target.layoutIfNeeded()
        })
    }
    
    func removeAllGesture() {
        if let recognizers = self.gestureRecognizers {
            for recognizer in recognizers {
                self.removeGestureRecognizer(recognizer)
            }
        }
    }
    
    func addBackGroundColor() {
        backgroundColor = .backColor
    }
    
    func prepareCircle() {
        layer.cornerRadius =  frame.width/2
    }
    
    func roundTopCorners() {
        roundCorners([.topLeft,.topRight], radius: 5)

    }
    
    func roundBottomCorners() {
        roundCorners([.bottomLeft,.bottomRight], radius: 5)
    }
    
    func roundCorners(_ corners:UIRectCorner, radius: CGFloat) {
        let path = UIBezierPath(roundedRect: self.bounds, byRoundingCorners: corners, cornerRadii: CGSize(width: radius, height: radius))
        let mask = CAShapeLayer()
        mask.path = path.cgPath
        self.layer.mask = mask
    }
    
    var asImage: UIImage? {
        if #available(iOS 10.0, *) {
            let renderer = UIGraphicsImageRenderer(bounds: bounds)
            let image = renderer.image { context in
                layer.render(in: context.cgContext)
            }
            return image
        } else {
            UIGraphicsBeginImageContextWithOptions(bounds.size, false, 0.0)
            defer { UIGraphicsEndImageContext() }
            guard let currentContext = UIGraphicsGetCurrentContext() else {
                return nil
            }
            self.layer.render(in: currentContext)
            return UIGraphicsGetImageFromCurrentImageContext()
        }
    }
}
