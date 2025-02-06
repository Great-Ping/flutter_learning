//
//  APViewControllerDetails.swift
//  APITest
//
//  Created by GoodDamn on 19/09/2024.
//

import Foundation
import UIKit

final class APViewControllerDetails
: UIViewController {
    
    var channelId: Int? = nil
    
    private let mServiceDetails = APServiceChannels()
    
    private var mLabelDesc: UILabel? = nil
    
    override func viewDidLoad() {
        super.viewDidLoad()
        
        view.backgroundColor = .white
        
        mLabelDesc = UILabel(
            frame: CGRect(
                x: 0,
                y: 100,
                width: view.frame.width,
                height: view.frame.height
            )
        )
        
        if let it = mLabelDesc {
            it.numberOfLines = 25
            view.addSubview(it)
        }
        mServiceDetails.delegateDetails = self
        
        if let id = channelId {
            mServiceDetails.getChannelDetailsAsync(
                id: id
            )
        }
    }
    
}

extension APViewControllerDetails
: APDelegateOnGetChannelDetails {
    
    func onGetChannelDetails(
        data: APModelChannelDetails
    ) {
        print(data)
        mLabelDesc?.text = data.description
    }
    
}
