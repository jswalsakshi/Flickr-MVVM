//
//  UserListingController.swift
//  Flickr-MVVM
//
//  Created by Sakshi Jaiswal on 18/07/20.
//  Copyright © 2020 Sakshi Jaiswal. All rights reserved.
//

import UIKit

protocol UserListingControllerDelegate: class {
  func naviagteToNextPage(_ controller: UserListingController, didTapProduct listings: [ListingModel])
}

class UserListingController: UIViewController, Storyboarded {
    
    @IBOutlet weak var tableView_user: UITableView!
    
    var viewModelUser: UserListingViewModel?
    var delegate: UserListingControllerDelegate?
    
    override func viewDidLoad() {
        super.viewDidLoad()
        self.title = "Users"
    }
    
    override func viewDidAppear(_ animated: Bool) {
        viewModelUser?.requestPostData {
            self.tableView_user.reloadData()
        }
    }

}

extension UserListingController: UITableViewDataSource, UITableViewDelegate {
  func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
    return self.viewModelUser?.count ?? 0
  }

  
  func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
    let cell = tableView.dequeueReusableCell(withIdentifier: "ListCell", for: indexPath)
    let id = self.viewModelUser?.getPost(index: indexPath.row).id
    cell.textLabel?.text = "User \(id ?? 0)"
    return cell
  }
  
  func tableView(_ tableView: UITableView, didSelectRowAt indexPath: IndexPath) {
    self.delegate?.naviagteToNextPage(self, didTapProduct: self.viewModelUser!.getPost(index: indexPath.row).data)
  }
}

