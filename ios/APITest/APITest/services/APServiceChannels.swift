//
//  APServiceChannels.swift
//  APITest
//
//  Created by GoodDamn on 19/09/2024.
//

import Foundation

final class APServiceChannels {
    
    weak var delegate: APDelegateOnGetChannels? = nil
    weak var delegateDetails: APDelegateOnGetChannelDetails? = nil
    
    func getChannelDetailsAsync(
        id: Int
    ) {
        URL(
            string: "https://damntv.ru/api/channels/\(id)"
        )?.loadData { [weak self] data in
            let decoder = JSONDecoder()
            do {
                let details = try decoder.decode(
                    APModelChannelDetails.self,
                    from: data
                )
                DispatchQueue.main.async { [weak self] in
                    self?.delegateDetails?.onGetChannelDetails(
                        data: details
                    )
                }
            } catch {
                print("ERROR: ", error)
            }
        }
    }
    
    func getChannelsAsync() {
        URL(
            string: "https://damntv.ru/api/channels"
        )?.loadData { [weak self] data in
            let decoder = JSONDecoder()
            do {
                let channels = try decoder.decode(
                    APModelChannels.self,
                    from: data
                )
                DispatchQueue.main.async { [weak self] in
                    self?.delegate?.onGetChannels(
                        data: channels.channels
                    )
                }
            } catch {
                print("ERROR: ", error)
            }
        }
        
    }
    
    deinit {
        print("APServiceChannels: deinit")
    }
}
