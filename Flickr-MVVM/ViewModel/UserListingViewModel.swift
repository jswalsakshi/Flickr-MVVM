//
//  UserListingViewModel.swift
//  Flickr-MVVM
//
//  Created by Sakshi Jaiswal on 19/07/20.
//  Copyright © 2020 Sakshi Jaiswal. All rights reserved.
//

import Foundation

protocol UserListingProtocol {
    var userSessionManager: UserSessionManager { get set }
    var listingPosts: [(id: Int, data: [ListingModel])] { get set }
}

class UserListingViewModel: UserListingProtocol {
    var userSessionManager: UserSessionManager
    
    var listingPosts = [(id: Int, data: [ListingModel])]()
    
    var count: Int {
        return listingPosts.count
    }
    
    func getPost(index: Int) -> (id: Int, data: [ListingModel])  {
        return listingPosts[index]
    }
    
    init() {
        userSessionManager = UserSessionManager()
    }
    
    //TODO: need to handle failure case as well.
    func requestPostData(completion:@escaping () -> ()) {
        
        userSessionManager.requestPosts(completion: { (listings) in
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
