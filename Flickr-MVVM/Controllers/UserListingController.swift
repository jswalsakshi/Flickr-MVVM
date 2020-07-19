//
//  UserListingController.swift
//  Flickr-MVVM
//
//  Created by Sakshi Jaiswal on 18/07/20.
//  Copyright © 2020 Sakshi Jaiswal. All rights reserved.
//

import UIKit

class UserListingController: UIViewController {
    
    let sessionManager = SessionManager()

    override func viewDidLoad() {
        super.viewDidLoad()
        sessionManager.getUserResults { (results, errorMessage) in
            print(results)
        }
    }
}
