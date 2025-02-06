//
//  APViewCellCollectionChannel.swift
//  APITest
//
//  Created by GoodDamn on 19/09/2024.
//

import Foundation
import UIKit

final class APViewCellCollectionChannel
: UICollectionViewCell {
    
    static let id = "channel"
    
    var title: String? {
        get {
            mLabelTitle.text
        }
        set(v) {
            mLabelTitle.text = v
        }
    }
    
    var imageUrl: String? {
        didSet {
            guard let v = imageUrl else {
                return
            }
            mImageView.loadUrl(
                string: v
            )
        }
    }
    
    var imageChannel: UIImage? {
        get {
            mImageView.image
        }
        
        set(v) {
            mImageView.image = v
        }
    }
    
    private let mLabelTitle = UILabel()
    private let mImageView = UIImageView()
    
    override init(
        frame: CGRect
    ) {
        super.init(
            frame: frame
        )
        
        mLabelTitle.numberOfLines = 2
        
        contentView.addSubview(
            mImageView
        )
        
        contentView.addSubview(
            mLabelTitle
        )
    }
    
    required init?(
        coder: NSCoder
    ) {
        super.init(
            coder: coder
        )
    }
    
    override func layoutSubviews() {
        super.layoutSubviews()
        
        let offsetTitle = frame.height
        let imageSize = offsetTitle * 0.5
        
        mImageView.frame = CGRect(
            x: (offsetTitle - imageSize) * 0.5,
            y: (frame.height - imageSize) * 0.5,
            width: imageSize,
            height: imageSize
        )
        
        mLabelTitle.frame = CGRect(
            x: offsetTitle,
            y: 0,
            width: frame.width - offsetTitle,
            height: frame.height
        )
        
        mLabelTitle.font = mLabelTitle.font.withSize(
            frame.height * 0.4
        )
    }
    
}
