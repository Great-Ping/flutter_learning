//
//  UIImageView.swift
//  APITest
//
//  Created by GoodDamn on 19/09/2024.
//

import Foundation
import UIKit

extension UIImageView {
    
    func loadUrl(
        string: String
    ) {
        URL(
            string: string
        )?.loadData {
            [weak self] data in
            let image = UIImage(
                data: data
            )
            
            DispatchQueue.main.async {
                [weak self] in
                self?.image = image
            }
        }
    }
    
}
