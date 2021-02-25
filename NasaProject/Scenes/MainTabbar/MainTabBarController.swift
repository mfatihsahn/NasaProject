//
//  MainTabBarController.swift
//  NasaProject
//
//  Created by FATIH on 23.02.2021.
//

import UIKit

class MainTabBarController: UITabBarController {

   var spiritPage  =  RouterStoryBoard.Home.initialViewController(type: HomeViewController.self)
   var opportunityPage  =  RouterStoryBoard.Home.initialViewController(type: HomeViewController.self)
   var curiosityPage  =  RouterStoryBoard.Home.initialViewController(type: HomeViewController.self)

    override func viewDidLoad() {
        super.viewDidLoad()
        self.updateTabBar()
        self.createViewControllers()
    }

    private func updateTabBar()  {
        
        self.tabBar.isTranslucent = false
        self.tabBar.tintColor = .white
        self.tabBar.unselectedItemTintColor = .gray
    }
    
    private func createTabBarController(viewController: UIViewController, title: String , imageName: String, selectedImage: String, tag: Int) -> MainTabBarNav {
        let tabBarItem = UITabBarItem(title: title, image: UIImage(named: imageName), selectedImage: UIImage(named: selectedImage))
        tabBarItem.tag = tag
        viewController.tabBarItem = tabBarItem
        return MainTabBarNav(rootViewController: viewController)
    }
    func createViewControllers() {
        
        spiritPage.viewModel = HomeViewModel()
        let spiritViewController = createTabBarController(viewController: spiritPage,
                                                        title: "spirit",
                                                        imageName: "spiritIcon",
                                                        selectedImage: "spiritIcon",
                                                        tag: 0)
        
        opportunityPage.viewModel = HomeViewModel()
        let opportunityViewController = createTabBarController(viewController: opportunityPage,
                                                        title: "Opportunity",
                                                        imageName: "opportunityIcon",
                                                        selectedImage: "opportunityIcon",
                                                        tag: 1)
        
        curiosityPage.viewModel = HomeViewModel()
        let curiosityViewController = createTabBarController(viewController: curiosityPage,
                                                        title: "Curiosity",
                                                        imageName: "curiosityIcon",
                                                        selectedImage: "curiosityIcon",
                                                        tag: 2)
        
        let VCs = [spiritViewController,opportunityViewController,curiosityViewController]
        
        self.setViewControllers(VCs, animated: false)
    }
}
