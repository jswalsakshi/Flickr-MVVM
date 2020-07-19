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

extension UserListingController: UITableViewDataSource, UITableViewDelegate {
  func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
    return self.viewModelUser.users.count
  }

  
  func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
    let cell = tableView.dequeueReusableCell(withIdentifier: "ListCell", for: indexPath)
    if let id = self.viewModelUser.users[indexPath.row].id {
        cell.textLabel?.text = "User \(id)"
    }
    return cell
  }
  
  func tableView(_ tableView: UITableView, didSelectRowAt indexPath: IndexPath) {
//    self.delegate?.naviagteToNextPage(self, didTapProduct: self.viewModel!.getPost(index: indexPath.row).data)
  }
}

