//
//  AppDelegate.swift
//  Flickr-MVVM
//
//  Created by Sakshi Jaiswal on 18/07/20.
//  Copyright © 2020 Sakshi Jaiswal. All rights reserved.
//

import UIKit

@UIApplicationMain
class AppDelegate: UIResponder, UIApplicationDelegate {
  var window: UIWindow?

  func application(_ application: UIApplication, didFinishLaunchingWithOptions launchOptions: [UIApplication.LaunchOptionsKey: Any]?) -> Bool {

    createDashboard()
    return true
  }

  private func createDashboard() {
    self.window = UIWindow(frame: UIScreen.main.bounds)

    let nav1 = UINavigationController()
    let flickrCoordinator = FlickrCoordinator(navigationController: nav1)
    flickrCoordinator.start()

    let nav2 = UINavigationController()
    let listingCordinator = ListingCordinator(navigationController: nav2)
    listingCordinator.start()
    
    let nav3 = UINavigationController()
    let technologyCoordinator = TechnologyCoordinator(navigationController: nav3)
    technologyCoordinator.start()

    let tabController = UITabBarController()

    tabController.viewControllers = [nav2, nav1, nav3]

    let item1 = tabController.tabBar.items?[0]
    item1?.title = "Listing"
    item1?.image = UIImage(named: "book-cover")
    item1?.selectedImage = UIImage(named: "book-cover")

    let item2 = tabController.tabBar.items?[1]
    item2?.title = "Recent"
    item2?.image = UIImage(named: "RecentEmpty")
    item2?.selectedImage = UIImage(named: "RecentFilled")
    

    let item3 = tabController.tabBar.items?[2]
    item3?.title = "Recent"
    item3?.image = UIImage(named: "warningIconLight")
    item3?.selectedImage = UIImage(named: "infoIcon")

    
    tabController.selectedIndex = 0

    self.window!.rootViewController = tabController
    self.window?.makeKeyAndVisible()
  }
    
    // MARK: UISceneSession Lifecycle
    
    func application(_ application: UIApplication, configurationForConnecting connectingSceneSession: UISceneSession, options: UIScene.ConnectionOptions) -> UISceneConfiguration {
        // Called when a new scene session is being created.
        // Use this method to select a configuration to create the new scene with.
        return UISceneConfiguration(name: "Default Configuration", sessionRole: connectingSceneSession.role)
    }
    
    func application(_ application: UIApplication, didDiscardSceneSessions sceneSessions: Set<UISceneSession>) {
        // Called when the user discards a scene session.
        // If any sessions were discarded while the application was not running, this will be called shortly after application:didFinishLaunchingWithOptions.
        // Use this method to release any resources that were specific to the discarded scenes, as they will not return.
    }
    
    
}

