//
//  MainTabController.swift
//  YoutubeClone
//
//  Created by minhdtn on 23/08/2022.
//

import UIKit
class MainTabController: UITabBarController {
    // MARK: - Properties

    // MARK: Lifecycle
    override func viewDidLoad() {
        super.viewDidLoad()
        configureViewControllers()
    }
    // MARK: - API
    // MARK: - Helpers
    func configureViewControllers() {
          tabBar.backgroundColor = .systemGray5
          view.backgroundColor = .white
          
          let layout =  UICollectionViewFlowLayout()
          let home = templateNavigationController(unselectedImage: UIImage(named: "home_unselected")!, selectedImage: UIImage(named: "home_selected")!, rootViewController: HomeController(collectionViewLayout: layout), title: "Home")
          
          let explore = templateNavigationController(unselectedImage: UIImage(named: "fire_unselected")!, selectedImage: UIImage(named: "fire_selected")!, rootViewController: ExploreController(), title: "Explore")
          let profile = templateNavigationController(unselectedImage: UIImage(named: "profile_unselected")!, selectedImage: UIImage(named: "profile_selected")!, rootViewController: ProfileController(), title: "Subscriptions")
          let subcriptions = templateNavigationController(unselectedImage: UIImage(named: "subscribe_unselected")!, selectedImage: UIImage(named: "subscribe_selected")!, rootViewController: SubscriptionsController(), title: "Profile")

          viewControllers = [home, explore, subcriptions, profile]
          tabBar.tintColor = .black
      }
    func templateNavigationController(unselectedImage: UIImage, selectedImage: UIImage, rootViewController: UIViewController, title: String) -> UINavigationController {
        let nav = UINavigationController(rootViewController: rootViewController)
        nav.tabBarItem.image = unselectedImage
        nav.tabBarItem.selectedImage = selectedImage
        nav.tabBarItem.title = title
        nav.navigationBar.tintColor = .black
        return nav
    }
    
}
