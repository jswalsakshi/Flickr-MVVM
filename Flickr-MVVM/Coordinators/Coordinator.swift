//
//  Coordinator.swift
//  Flickr-MVVM
//
//  Created by Sakshi Jaiswal on 19/07/20.
//  Copyright © 2020 Sakshi Jaiswal. All rights reserved.
//

import UIKit

public protocol Coordinator : class {

  var childCoordinators: [Coordinator] { get set }
  
  // All coordinators will be initilised with a navigation controller
  init(navigationController:UINavigationController)
  
  func start()
}

