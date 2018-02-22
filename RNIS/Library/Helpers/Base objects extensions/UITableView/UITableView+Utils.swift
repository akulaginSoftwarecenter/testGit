//
//  UITableView.swift
//  Solity-iOS
//
//  Created by Artem Kulagin on 01.09.16.
//  Copyright © 2016 el-machine. All rights reserved.
//

import UIKit
/**
 Расширение для UITableView
 */
extension UITableView
{
    func registerCell(_ reuseID: String)    {
        let nib = UINib(nibName: reuseID, bundle:nil)
        self.register(nib, forCellReuseIdentifier: reuseID)
    }
    
    var tableViewContentSize:CGFloat{
        var height:CGFloat = 0
        let numberOfRowsInSection = self.numberOfRows(inSection: 0)
        if numberOfRowsInSection > 0  {
            for i in 0...numberOfRowsInSection - 1 {
                let rect = self.rectForRow(at: IndexPath(row: i, section: 0))
                height += rect.height
            }
        }
        return height
    }
    
    func updates()    {
        let lastScrollOffset = self.contentOffset
        self.beginUpdates()
        self.endUpdates()
        self.layer.removeAllAnimations()
        self.setContentOffset(lastScrollOffset, animated: false)
    }
    
    func register<T: UITableViewCell>(_ : T.Type) {
        let cellNib = UINib(nibName: T.nibName, bundle: nil)
        self.register(cellNib, forCellReuseIdentifier: T.reuseIdentifier)
    }
    
    func registerHeaderFooterView<T: UITableViewHeaderFooterView>(_ : T.Type) where T: ReusableView, T: NibLoadableView {
        let cellNib = UINib(nibName: T.nibName, bundle: nil)
        self.register(cellNib, forHeaderFooterViewReuseIdentifier: T.reuseIdentifier)
    }
    
    func dequeueReusableCell<T: UITableViewCell>(for indexPath: IndexPath) -> T {
        guard let cell = self.dequeueReusableCell(withIdentifier: T.reuseIdentifier, for: indexPath) as? T else {
            fatalError("Could not dequeue cell with identifier: " + String(T.reuseIdentifier) + " or edit custom class to XIB file")
        }
        return cell
    }
 
    func dequeueReusableCell(_ T:UITableViewCell.Type, forIndexPath indexPath: IndexPath) -> UITableViewCell    {
        return self.dequeueReusableCell(withIdentifier: T.reuseIdentifier, for: indexPath)
    }
   
    func dequeueReusableHeaderFooterView<T: UITableViewHeaderFooterView>() -> T where T: ReusableView, T: NibLoadableView {
        guard let cell = self.dequeueReusableHeaderFooterView(withIdentifier: T.reuseIdentifier) as? T else {
            fatalError("Could not dequeue header footer view with identifier: " + String(T.reuseIdentifier))
        }
        return cell
    }
}
