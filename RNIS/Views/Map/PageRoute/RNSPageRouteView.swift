//
//  RNSPageRouteView.swift
//  RNIS
//
//  Created by Артем Кулагин on 21.08.17.
//  Copyright © 2017 Артем Кулагин. All rights reserved.
//

import UIKit

class RNSPageRouteView: BaseViewWithXIBInit {
    
    @IBOutlet weak var pageControl: UIPageControl!
    @IBOutlet weak var collectionView: UICollectionView!
    
    var items: [RNSRouteVariant]? {
        didSet {
            reloadData()
        }
    }
    
    func reloadData() {
        pageControl.numberOfPages = itemsCount
        collectionView.reloadData()
    }

    override func awakeFromNib() {
        super.awakeFromNib()
        
        prepareSizeCell()
    }
}
