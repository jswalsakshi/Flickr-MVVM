//
//  FlickrCoordinator.swift
//  Flickr-MVVM
//
//  Created by Sakshi Jaiswal on 20/07/20.
//  Copyright © 2020 Sakshi Jaiswal. All rights reserved.
//

//import UIKit
//
//class RecentImagesCordinator: Coordinator {
//
//  var childCoordinators: [Coordinator] = []
//
//  let navigationController: UINavigationController
//
//  required init(navigationController: UINavigationController) {
//    self.navigationController = navigationController
//  }
//
//  func start() {
//    let viewModel = PhotosRecentCollectionViewModel()
//    let recentViewController : RecentViewController = RecentViewController(withViewModel: viewModel)
//    recentViewController.delegate = self
//    self.navigationController.viewControllers = [recentViewController]
//  }
//
//}
//
//
//extension RecentImagesCordinator: RecentViewControllerDelegate {
//
//  func naviagteToNextPage(_ controller: RecentViewController, didTapProduct product: Product) {
//    navigationController.pushViewController(controller, animated: true)
//  }
//
//}
