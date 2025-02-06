//
//  URL.swift
//  APITest
//
//  Created by GoodDamn on 19/09/2024.
//

import Foundation

extension URL {
    
    func loadData(
        completion: @escaping (Data) -> Void
    ) {
        URLSession.shared.dataTask(
            with: URLRequest(
                url: self
            )
        ) { data, response, error in
            
            guard let data = data, error == nil else {
                return
            }
            
            completion(
                data
            )
        }.resume()
    }
    
}
