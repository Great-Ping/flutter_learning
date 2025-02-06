//
//  APModelChannels.swift
//  APITest
//
//  Created by GoodDamn on 19/09/2024.
//

import Foundation

struct APModelChannels
: Decodable {
    let totalCount: Int
    let channels: [APModelChannel]
}
