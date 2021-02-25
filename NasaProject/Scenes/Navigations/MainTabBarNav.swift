//
//  MainTabBarNav.swift
//  NasaProject
//
//  Created by FATIH on 23.02.2021.
//


import UIKit

class MainTabBarNav: UINavigationController, UINavigationControllerDelegate {
    
    override func viewDidLoad() {
        super.viewDidLoad()
        let backItem = UIBarButtonItem()
        backItem.title = ""
        self.navigationItem.backBarButtonItem = backItem
        NavAppearnce()
        
    }
    
    func NavAppearnce() {
        let tintColor : UIColor = .black
            self.navigationBar.titleTextAttributes = [NSAttributedString.Key.foregroundColor: tintColor, NSAttributedString.Key.font: UIFont.systemFont(ofSize: 16)]
        
        if #available(iOS 13.0, *) {
            let navBarAppearance = UINavigationBarAppearance()
            navBarAppearance.configureWithOpaqueBackground()
            navBarAppearance.backgroundColor = .white
            navBarAppearance.shadowColor = .clear
            self.navigationBar.tintColor = tintColor
            self.navigationBar.isTranslucent = true
            UINavigationBar.appearance().barTintColor = .clear
            self.navigationBar.setBackgroundImage(UIImage(), for: .default)
            self.navigationBar.standardAppearance = navBarAppearance
            self.navigationBar.compactAppearance = navBarAppearance
            self.navigationBar.scrollEdgeAppearance = navBarAppearance
        }else{
            self.navigationBar.setBackgroundImage(UIImage(), for: .default)
            self.navigationBar.shadowImage = UIImage()
            self.navigationBar.isTranslucent = true
            self.navigationBar.backgroundColor = .white
            self.navigationBar.tintColor = tintColor
        }
    }
}
