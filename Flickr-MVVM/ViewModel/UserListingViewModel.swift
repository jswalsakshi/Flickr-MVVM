//
//  UserListingViewModel.swift
//  Flickr-MVVM
//
//  Created by Sakshi Jaiswal on 19/07/20.
//  Copyright © 2020 Sakshi Jaiswal. All rights reserved.
//

import UIKit

class UserListingViewModel {
    weak var vc: UserListingController?
    var users = [UserListing]()
    
    func getAllUserData() {
        URLSession.shared.dataTask(with: URL(string: "http://jsonplaceholder.typicode.com/posts")!) {(data, response, error) in
            if error == nil {
                if let data = data {
                    do {
                        let userResponse = try JSONDecoder().decode([UserListing].self, from: data)
                        self.users.append(contentsOf: userResponse)
                        print(userResponse)
                        DispatchQueue.main.async {
                            self.vc?.tableView_user.reloadData()
                        }
                    } catch let err{
                        print(err.localizedDescription)
                    }
                }
            } else {
                print(error?.localizedDescription as Any)
            }
        }.resume()
    }
    
}




