//
//  RouterStoryBoard.swift
//  NasaProject
//
//  Created by FATIH on 23.02.2021.
//

import UIKit


enum RouterStoryBoard: String {
    case Home
    case Filter
}

extension RouterStoryBoard {
    
    func initialViewController<ViewController: UIViewController>(type: ViewController.Type) -> ViewController {
        guard let viewController = UIStoryboard.init(name: self.rawValue,
                                                     bundle: nil).instantiateViewController(
                                                        withIdentifier: "\(ViewController.self)"
                                                     ) as? ViewController else {
            fatalError("Couldn't initial view controller with type \(ViewController.self)")
        }
        return viewController
    }
    func initialViewController() -> UIViewController? {
        return UIStoryboard.init(name: self.rawValue, bundle: nil).instantiateInitialViewController()
    }
    
    func toHome() {
        let viewController = MainTabBarController()
        let mainwindow: UIWindow?
        mainwindow = ((UIApplication.shared.delegate?.window)) as? UIWindow
        
        let vc = viewController
        if let window = mainwindow {
            window.rootViewController = vc
            UIView.transition(with: window, duration: 1, options: .transitionFlipFromLeft, animations: nil, completion: nil)
        }
    }
}
