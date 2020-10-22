//
//  BountyInfo.swift
//  BountyList
//
//  Created by 문효재 on 2020/10/22.
//

import UIKit

struct BountyInfo {
    let name: String
    let bounty: Int
    var image: UIImage? {
        return UIImage(named: "\(name).jpg")
    }
    
    init(name: String, bounty: Int) {
        self.name = name
        self.bounty = bounty
    }
}
