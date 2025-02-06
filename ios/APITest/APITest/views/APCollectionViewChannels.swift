//
//  APCollectionViewChannels.swift
//  APITest
//
//  Created by GoodDamn on 19/09/2024.
//

import Foundation
import UIKit

final class APCollectionViewChannels
: UICollectionView {
    
    var channels: [APModelChannel]? = nil {
        didSet {
            print("reloadData")
            reloadData()
        }
    }
    
    weak var navigationController: UINavigationController? = nil
    
    private var mCellSize: CGSize = .zero
    
    init(
        frame: CGRect,
        orientation: UICollectionView.ScrollDirection
    ) {
        let layout = UICollectionViewFlowLayout()
        layout.scrollDirection = orientation
        super.init(
            frame: frame,
            collectionViewLayout: layout
        )
        
        mCellSize = CGSize(
            width: frame.width,
            height: frame.height * 0.1
        )
        
        register(
            APViewCellCollectionChannel.self,
            forCellWithReuseIdentifier: APViewCellCollectionChannel.id
        )
        
        delegate = self
        dataSource = self
    }
    
    required init?(
        coder: NSCoder
    ) {
        super.init(
            coder: coder
        )
    }
}

extension APCollectionViewChannels
: UICollectionViewDataSource {
    
    func numberOfSections(
        in collectionView: UICollectionView
    ) -> Int {
        channels?.count ?? 0
    }
    
    func collectionView(
        _ collectionView: UICollectionView,
        numberOfItemsInSection section: Int
    ) -> Int {
        1
    }
    
    func collectionView(
        _ collectionView: UICollectionView,
        didSelectItemAt indexPath: IndexPath
    ) {
        guard let model = channels?[
            indexPath.section
        ] else {
            return
        }
        
        let controller = APViewControllerDetails()
        controller.channelId = model.id
        controller.title = model.name
        navigationController?.pushViewController(
            controller,
            animated: true
        )
    }
    
    func collectionView(
        _ collectionView: UICollectionView,
        cellForItemAt indexPath: IndexPath
    ) -> UICollectionViewCell {
        let index = indexPath.section
        guard let cell = collectionView.dequeueReusableCell(
            withReuseIdentifier: APViewCellCollectionChannel.id,
            for: indexPath
        ) as? APViewCellCollectionChannel,
        let model = channels?[index] else {
            return UICollectionViewCell()
        }
        
        cell.title = model.name
        cell.imageUrl = model.imageUrl
        
        return cell
    }
    
}

extension APCollectionViewChannels
: UICollectionViewDelegateFlowLayout {
    
    func collectionView(
        _ collectionView: UICollectionView,
        layout collectionViewLayout: UICollectionViewLayout,
        insetForSectionAt section: Int
    ) -> UIEdgeInsets {
        UIEdgeInsets(
            top: 15,
            left: 0,
            bottom: 0,
            right: 0
        )
    }
    
    func collectionView(
        _ collectionView: UICollectionView,
        layout collectionViewLayout: UICollectionViewLayout,
        minimumInteritemSpacingForSectionAt section: Int
    ) -> CGFloat {
        0.0
    }
    
    func collectionView(
        _ collectionView: UICollectionView,
        layout collectionViewLayout: UICollectionViewLayout,
        sizeForItemAt indexPath: IndexPath
    ) -> CGSize {
        mCellSize
    }
    
}

extension APCollectionViewChannels
: UICollectionViewDelegate {
    
}
