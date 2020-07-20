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
    
    var viewModel: UserListingViewModel?
    var delegate: UserListingControllerDelegate?
    
    
    @IBOutlet weak var tableView_user: UITableView!

    override func viewDidLoad() {
        super.viewDidLoad()
        self.title = "Users"
    }
    
    override func viewDidAppear(_ animated: Bool) {
        super.viewDidAppear(animated)
        viewModel?.requestPostData(completion: {
            DispatchQueue.main.async {
                self.tableView_user.reloadData()
            }
        })
    }
}


extension UserListingController: UITableViewDataSource, UITableViewDelegate {
    func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
        return self.viewModel?.count ?? 0
    }
    
    func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
        let cell = tableView.dequeueReusableCell(withIdentifier: "ListCell", for: indexPath)
        let id = self.viewModel!.getPost(index: indexPath.row).id
        cell.textLabel?.text = "User \(id)"
        return cell
    }
    
    func tableView(_ tableView: UITableView, didSelectRowAt indexPath: IndexPath) {
        self.delegate?.naviagteToNextPage(self, didTapProduct: self.viewModel!.getPost(index: indexPath.row).data)
    }
}


