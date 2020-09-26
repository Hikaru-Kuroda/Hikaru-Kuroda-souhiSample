//
//  prefecture.swift
//  soushiSample
//
//  Created by 黑田光 on 2020/09/21.
//  Copyright © 2020 Hikaru Kuroda. All rights reserved.
//

import Foundation

struct Total: Codable {
    let hospitalize: Int
    let death: Int
}

struct Prefecture: Codable {
    let name_ja: String
    let hospitalize: Int
    let deaths: Int
}
