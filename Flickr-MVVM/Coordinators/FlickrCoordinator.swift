//
//  FlickrCoordinator.swift
//  Flickr-MVVM
//
//  Created by Sakshi Jaiswal on 20/07/20.
//  Copyright © 2020 Sakshi Jaiswal. All rights reserved.
//

import UIKit

class FlickrCoordinator: Coordinator {
    
    var childCoordinators: [Coordinator] = []
    
    let navigationController: UINavigationController
    
    required init(navigationController: UINavigationController) {
        self.navigationController = navigationController
    }
    
    func start() {
        let viewModel = FlickrViewModel()
        let flickrViewController : FlickrViewController = FlickrViewController(withViewModel: viewModel)
        flickrViewController.delegate = self
        self.navigationController.viewControllers = [flickrViewController]
    }
}


extension FlickrCoordinator: FlickrViewControllerDelegate {
    
    func naviagteToNextPage(_ controller: FlickrViewController, didTapProduct product: Product) {
        navigationController.pushViewController(controller, animated: true)
    }
    
}
