//
//  APDelegateOnGetChannelDetails.swift
//  APITest
//
//  Created by GoodDamn on 19/09/2024.
//

import Foundation

protocol APDelegateOnGetChannelDetails
: AnyObject {
    
    func onGetChannelDetails(
        data: APModelChannelDetails
    )
}
