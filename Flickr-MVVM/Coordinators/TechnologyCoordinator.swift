//
//  TechnologyCoordinator.swift
//  Flickr-MVVM
//
//  Created by Sakshi Jaiswal on 20/07/20.
//  Copyright © 2020 Sakshi Jaiswal. All rights reserved.
//

import UIKit

class TechnologyCoordinator: Coordinator {
    
    var childCoordinators: [Coordinator] = []
    
    let navigationController: UINavigationController
    
    required init(navigationController: UINavigationController) {
        self.navigationController = navigationController
    }
    
    func start() {
        let listingViewController : UsedTechnologyController = UsedTechnologyController.instantiate()
        self.navigationController.viewControllers = [listingViewController]
    }
}
