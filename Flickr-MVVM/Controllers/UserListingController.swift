//
//  UserListingController.swift
//  Flickr-MVVM
//
//  Created by Sakshi Jaiswal on 18/07/20.
//  Copyright © 2020 Sakshi Jaiswal. All rights reserved.
//

import UIKit

class UserListingController: UIViewController {
    
    @IBOutlet weak var tableView_user: UITableView!
    
    var viewModelUser = UserListingViewModel()
    
    override func viewDidLoad() {
        super.viewDidLoad()
        viewModelUser.vc = self
        viewModelUser.getAllUserData()
    }
}
