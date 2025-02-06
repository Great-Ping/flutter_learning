//
//  APDelegateOnGetChannels.swift
//  APITest
//
//  Created by GoodDamn on 19/09/2024.
//

import Foundation

protocol APDelegateOnGetChannels
: AnyObject {
    func onGetChannels(
        data: [APModelChannel]
    )
}
