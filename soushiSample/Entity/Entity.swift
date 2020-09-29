//
//  prefecture.swift
//  soushiSample
//
//  Created by 黑田光 on 2020/09/21.
//  Copyright © 2020 Hikaru Kuroda. All rights reserved.
//

import Foundation

// https://covid19-japan-web-api.now.sh/api//v1/total
struct Total: Codable {
    let pcr: Int
    let positive: Int
    let hospitalize: Int
    let severe: Int
    let discharge: Int
    let death: Int
}

// https://covid19-japan-web-api.now.sh/api//v1/prefectures
struct Prefecture: Codable {
    let name_ja: String
    let hospitalize: Int
    let deaths: Int
}
