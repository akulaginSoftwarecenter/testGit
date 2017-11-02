//
//  UICollectionView+Utils.swift
//  Solity-iOS
//
//  Created by Artem Kulagin on 16.09.16.
//  Copyright © 2016 el-machine. All rights reserved.
//

import UIKit

extension UICollectionViewCell: ReusableView, NibLoadableView
{}

extension UICollectionView
{
    func register<T: UICollectionViewCell>(_ : T.Type)
    {
        let cellNib = UINib(nibName: T.nibName, bundle: nil)
        self.register(cellNib, forCellWithReuseIdentifier: T.reuseIdentifier)
    }
    
    func registerCell(_ reuseID: String)    {
        let nib = UINib(nibName: reuseID, bundle:nil)
        self.register(nib, forCellWithReuseIdentifier: reuseID)
    }
    
    func dequeueReusableCell<T: UICollectionViewCell>(forIndexPath indexPath: IndexPath) -> T 
    {
        guard let cell = self.dequeueReusableCell(withReuseIdentifier: T.reuseIdentifier, for: indexPath) as? T else {
            fatalError("Could not dequeue cell with identifier: " + String(T.reuseIdentifier))
        }
        return cell
    }
}
