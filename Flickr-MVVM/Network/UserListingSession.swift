//
//  UserListingSession.swift
//  Flickr-MVVM
//
//  Created by Sakshi Jaiswal on 19/07/20.
//  Copyright © 2020 Sakshi Jaiswal. All rights reserved.
//

import Foundation

class UserListingSession: SessionManager {
    
    // MARK: - API Request
    
    func requestPosts(completion: @escaping ([UserListing]) -> ()) {
        
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
    
    func parseListingData(value: Data) -> [UserListing]? {
        do {
            let listing = try JSONDecoder().decode([UserListing].self, from: value)
            print(listing)
            return listing
        } catch {
            print(error)
        }
        return nil
    }
    
}
