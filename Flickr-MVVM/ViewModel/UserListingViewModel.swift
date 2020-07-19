//
//  UserListingViewModel.swift
//  Flickr-MVVM
//
//  Created by Sakshi Jaiswal on 19/07/20.
//  Copyright © 2020 Sakshi Jaiswal. All rights reserved.
//

import Foundation

protocol ListingProtocol {
    var userListing: UserListingSession { get set }
    var listingPosts: [(id: Int, data: [UserListing])] { get set }
}


class UserListingViewModel: ListingProtocol {
    var userListing: UserListingSession
    
    var listingPosts = [(id: Int, data: [UserListing])]()
    
    var count: Int {
        return listingPosts.count
    }
    
    func getPost(index: Int) -> (id: Int, data: [UserListing])  {
        return listingPosts[index]
    }
    
    init() {
        userListing = UserListingSession()
    }
    
    //TODO: need to handle failure case as well.
    func requestPostData(completion:@escaping () -> ()) {
        
        userListing.requestPosts(completion: { (listings) in
            var ids = [Int]()
            self.listingPosts.removeAll()
            
            for list in listings {
                if !ids.contains(list.userId) {
                    ids.append(list.userId)
                }
            }
            
            for userId in ids {
                let post = listings.filter({$0.userId == userId })
                self.listingPosts.append((id:userId , data: post))
            }
            completion()
        })
    }
}



