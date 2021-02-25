//
//  Router+Base.swift
//  NasaProject
//
//  Created by FATIH on 24.02.2021.
//

import UIKit

extension BaseViewController {
    var appRouter: Router { Router.shared }
}

// MARK: - ROUTER CONFIGURATION
final class Router {
    
    public static let shared = Router()
    
    /// Initial Window
    var window: UIWindow?
    
    public func configure(_ window: UIWindow?, rootViewController: UIViewController? = nil) {
        self.window = window
        self.window?.makeKeyAndVisible()
        self.window?.rootViewController = rootViewController
    }
}

// MARK: - ROUTER BASE

extension Router {
    
    func setRootViewController( _ viewController: UIViewController, from: UIViewController? = nil ) {
        
        guard let window = self.window else {
            print("Window is not configured!!!")
            return
        }
        
        window.rootViewController = viewController
    }
    
    func push(_ viewController: UIViewController, from: UIViewController? = nil) {
        DispatchQueue.main.async {
            from?.navigationController?.pushViewController(viewController, animated: true)
        }
    }
    
    func pop(_ viewController: UIViewController?) {
        DispatchQueue.main.async {
            viewController?.navigationController?.popViewController(animated: true)
        }
    }
}
