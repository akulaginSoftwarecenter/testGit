//
//  RNSFavoritesBusView+items.swift
//  RNIS
//
//  Created by Артем Кулагин on 02.10.17.
//  Copyright © 2017 Артем Кулагин. All rights reserved.
//

import Foundation

extension RNSFavoritesBusView {
    
    func loadData() {
        loaderView.showInView(self)
        RNSPostFavoriteRouteList {[weak self] (reply, error, _) in
            self?.loaderView.remove()
            self?.prepareSections(reply as? [RNSFavoriteStopPoint])
        }
    }
    
    func prepareSections(_ items: [RNSFavoriteStopPoint]?) {
        sections = [TableSection]()
        let beside = items?.filter{ $0.isBeside }
        
        let long = items?.filter{ !(beside?.contains($0) ?? false) }
        
        if let beside =  beside, beside.count > 0 {
            sections.append(TableSection(title: "Рядом с вами", items: beside))
        }
        
        if let long = long, long.count > 0 {
            sections.append(TableSection(title: "Далеко", items: long))
        }
        tableView.reloadData()
    }
}
