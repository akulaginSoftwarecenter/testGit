//
//  KeyboardShowable.swift
//  Solity-iOS
//
//  Created by Vlad on 28.11.16.
//  Copyright © 2016 el-machine. All rights reserved.
//

import UIKit
import SnapKit

protocol KeyboardShowable: class {
    var viewBottomHeightLayoutConstraint: NSLayoutConstraint? { get }
    var viewBottomHeightConstraint: Constraint? { get }
    var view: UIView? { get }
    var isNeedAddTap: Bool { get }
    
    func addKeyboardObservers()
    func removeAllObservers()
    func keyboardWillShow()
    func keyboardWillHide()
    func hideKeyboardByTap()
}

extension KeyboardShowable
{
    var viewBottomHeightLayoutConstraint: NSLayoutConstraint? {
        return nil
    }
    
    var viewBottomHeightConstraint: Constraint? {
        return nil
    }
    
    fileprivate var classNotification: String {
        return String(describing: type(of: self)) + "Notification"
    }
    
    var view: UIView? {
        if let view = self as? UIView {
            return view
        } else if let viewController = self as? UIViewController {
            return viewController.view
        }
        
        return nil
    }
    
    var isNeedAddTap: Bool {
        return true
    }
    
    func keyboardWillShow() {}
    func keyboardWillHide() {}
    func hideKeyboardByTap() {
        view?.hideKeyboard()
    }
    
    func addKeyboardObservers() {
        removeAllObservers()
        
        let keyboardShow = NotificationCenter.keyboardWillShow {  [weak self]  (notification) in
            self?.additionalKeyboardWillShow(notification)
        }
        
        let keyboardHide = NotificationCenter.keyboardWillHide { [weak self]  (notification) in
            self?.additionalKeyboardWillHide(notification)
        }
        
        let defaultCenter = NotificationCenter.default
        var removeObserver: NSObjectProtocol?
        removeObserver = addObserverForName(classNotification) { [weak self] (notification) in
            
            defaultCenter.removeObserver(keyboardShow, name: NSNotification.Name.UIKeyboardWillShow, object: nil)
            
            defaultCenter.removeObserver(keyboardHide, name: NSNotification.Name.UIKeyboardWillHide, object: nil)
            guard let removeObserver = removeObserver else {
                return
            }
            defaultCenter.removeObserver(removeObserver, name: (self?.classNotification).map { NSNotification.Name(rawValue: $0) }, object: nil)
        }
        
        if isNeedAddTap {
            addTapGesture()
        }
    }
    
    func addObserverForName(_ name: String, usingBlock block: @escaping NotificationBlock) -> NSObjectProtocol {
        return NotificationCenter.addObserverForName(name, usingBlock: block)
    }
    
    fileprivate func additionalKeyboardWillShow(_ notification: Notification) {
        animateBottom(notification.height, duration: notification.duration)
        keyboardWillShow()
    }
    
    fileprivate func additionalKeyboardWillHide(_ notification: Notification) {

        animateBottom(0, duration: notification.duration)
        keyboardWillHide()
    }
    
    fileprivate func animateBottom(_ constant: CGFloat?, duration: Double?) {
        guard let constant = constant else {
            return
        }
        animateBottomConstraint(constant)
        animateBottomLayoutConstraint(constant)
        
        layoutIfNeeded(duration:duration)
    }
    
    fileprivate func animateBottomConstraint(_ constant: CGFloat) {
        guard let constraint = viewBottomHeightLayoutConstraint else {
                return
        }
        constraint.constant = constant
    }
    
    fileprivate func animateBottomLayoutConstraint(_ constant: CGFloat) {
        guard let constraint = viewBottomHeightConstraint else {
            return
        }
        constraint.update(inset: constant)
    }
    
    fileprivate func layoutIfNeeded(duration: Double?) {
        guard  let duration = duration else {
                return
        }
        UIView.animate(withDuration: duration, animations: { [unowned self] in
            self.view?.layoutIfNeeded()
        })
    }
    
    func removeAllObservers() {
        NotificationCenter.default.post(name: Notification.Name(rawValue: classNotification), object: nil)
        view?.removeAllGesture()
    }
}
