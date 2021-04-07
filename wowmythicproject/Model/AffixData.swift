//
//  AffixData.swift
//  wowmythicproject
//
//  Created by Nikolay Kalchev on 7.04.21.
//  Copyright © 2021 Nikolay Kalchev. All rights reserved.
//

import Foundation

struct AffixData: Codable {
    let affix_details: [AffixArray]
}

struct AffixArray: Codable {
    let id:Int
    let name:String
}
