//
//  APViewControllerList.swift
//  APITest
//
//  Created by GoodDamn on 19/09/2024.
//

import UIKit

final class APViewControllerList
: UIViewController {

    private let mService = APServiceChannels()
    
    private var mCollectionView: APCollectionViewChannels? = nil
    
    override func viewDidLoad() {
        super.viewDidLoad()
        
        title = "Channel's list"
        
        print("LIST: viewDidLoad:")
        
        mCollectionView = APCollectionViewChannels(
            frame: view.frame,
            orientation: .vertical
        )
        
        if let it = mCollectionView {
            it.navigationController = navigationController
            view.addSubview(it)
        }
        
        mService.delegate = self
        mService.getChannelsAsync()
    }

    deinit {
        print("APViewControllerList: deinit")
    }

}

extension APViewControllerList
: APDelegateOnGetChannels {
    
    func onGetChannels(
        data: [APModelChannel]
    ) {
        guard let collectionView = mCollectionView else {
            return
        }
        
        collectionView.channels = data
    }
    
}

