//
//  APModelChannel.swift
//  APITest
//
//  Created by GoodDamn on 19/09/2024.
//

import Foundation

struct APModelChannel
: Decodable {
    let id: Int
    let name: String
    let imageUrl: String?
    let assessment: Double
}
