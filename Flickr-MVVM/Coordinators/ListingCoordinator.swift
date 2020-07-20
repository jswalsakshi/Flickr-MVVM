//
//  ListingCoordinator.swift
//  Flickr-MVVM
//
//  Created by Sakshi Jaiswal on 19/07/20.
//  Copyright © 2020 Sakshi Jaiswal. All rights reserved.
//

import UIKit

class ListingCordinator: Coordinator {

  var childCoordinators: [Coordinator] = []

  let navigationController: UINavigationController

  required init(navigationController: UINavigationController) {
    self.navigationController = navigationController
  }

  func start() {
    let viewModelUser = UserListingViewModel()
    let userListingController : UserListingController = UserListingController.instantiate()
    userListingController.viewModel = viewModelUser
    userListingController.delegate = self
    self.navigationController.viewControllers = [userListingController]
  }
}

extension ListingCordinator: UserListingControllerDelegate {
  func naviagteToNextPage(_ controller: UserListingController, didTapProduct listings: [ListingModel]) {
    let detailsVC = DetailViewController.instantiate()
    detailsVC.viewModel = DetailsViewModel(models: listings)
    self.navigationController.pushViewController(detailsVC, animated: true)
  }

}
