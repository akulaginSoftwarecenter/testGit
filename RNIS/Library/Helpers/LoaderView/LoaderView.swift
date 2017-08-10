//
//  LoaderView.swift
//  Solity-iOS
//
//  Created by Artem Kulagin on 27.10.16.
//  Copyright © 2016 el-machine. All rights reserved.
//

import UIKit

class LoaderView: BaseViewWithXIBInit {
    convenience init(_ delay: TimeInterval = 0) {
        self.init()
        
        self.delay = delay
    }
    
    var delay: TimeInterval = 0
    
    func showInView(_ view: UIView?) {
        addShowInView(view)
        self.autoPinEdgesToSuperviewEdges()
        animationShow()
    }
    
    func showInView(_ view: UIView?, frame: CGRect) {
        addShowInView(view)
        self.frame = frame
        animationShow()
    }
    
    func addShowInView(_ view: UIView?) {
        guard isEmptySuperView,
            let view = view else {
                return
        }
        view.addSubview(self)
    }
    
    func animationShow() {
        UIView.animate(withDuration: 0.5, delay: delay, options: .curveLinear, animations: {[weak self] in
            self?.alpha = 0.3
            }, completion:nil)
    }
    
    var isEmptySuperView: Bool{
        return superview == nil
    }
    
    func remove() {
        UIView.animate(withDuration: 0.2, animations: {[weak self] in
            self?.alpha = 0
            }, completion: { [weak self] (_) in
            self?.removeFromSuperview()
        }) 
    }
}
