//
//  UserListingSession.swift
//  Flickr-MVVM
//
//  Created by Sakshi Jaiswal on 19/07/20.
//  Copyright © 2020 Sakshi Jaiswal. All rights reserved.
//

import Foundation


class UserSessionManager: SessionManager {
    
    // MARK: - API Request
    
    func requestPosts(completion: @escaping ([ListingModel]) -> ()) {
        getRequestForPostListing( completion: { (value) in
            if value != nil {
                let responseString = String(data: value!, encoding: .utf8)
                print("Response string:\(responseString!)")
                if let listingData = self.parseListingData(value: value!) {
                    completion(listingData)
                }
            }
        })
    }
    
    func parseListingData(value: Data) -> [ListingModel]? {
        do {
            let listing = try JSONDecoder().decode([ListingModel].self, from: value)
            print(listing)
            return listing
        } catch {
            print(error)
        }
        return nil
    }
    
}
