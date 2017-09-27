//
//  RNSFavoritesBusView.swift
//  RNIS
//
//  Created by Артем Кулагин on 14.09.17.
//  Copyright © 2017 Артем Кулагин. All rights reserved.
//

import UIKit

class RNSFavoritesBusView: BaseViewWithXIBInit {
    struct TableSection {
        let title: String
        var items: [RNSBusStopTemp]
    }
    
    lazy var itemsBeside: [RNSBusStopTemp] = {
        let item1 = RNSBusStopTemp()
        item1.uuid = "0"
        item1.name = "ул. Ленина"
        item1.forecast = [RNSRouteBusTemp("88",time: 2, timePerod: nil),
                          RNSRouteBusTemp("228",time: nil, timePerod: 20)]
        
        let item2 = RNSBusStopTemp()
        item2.uuid = "1"
        item2.name = "Пушкина"
        item2.forecast = [RNSRouteBusTemp("23",time: nil, timePerod: 5),
                          RNSRouteBusTemp("100",time: nil, timePerod: 20)]
        return [item1, item2]
    }()
    
    lazy var itemsFar: [RNSBusStopTemp] = {
        let item1 = RNSBusStopTemp()
        item1.uuid = "3"
        item1.name = "ул. Лесная"
        item1.forecast = [RNSRouteBusTemp("288",time: nil, timePerod: 30)]
        return [item1]
    }()
    
    lazy var sections: [TableSection] = [
        TableSection(title: "Рядом с вами", items: itemsBeside),
        TableSection(title: "Далеко", items: itemsFar)
    ]

    @IBOutlet weak var tableView: UITableView!
    
    override func awakeFromNib() {
        super.awakeFromNib()
        
        tableView.contentInset = UIEdgeInsetsMake(27, 0, 0, 0);
        tableView.reloadData()
    }
}
