//
//  BaseViewModel.swift
//  NasaProject
//
//  Created by FATIH on 23.02.2021.
//

import UIKit

typealias Event = (()->())
typealias ErrorEvent = ((Error)->())

class BaseViewModel: NSObject {
    
    var onChange: Event?
    var isLoading = false
    var center = NotificationCenter.default
    
    var onLoadDidStart: Event?
    var onLoadDidFinish: Event?
    var onLoadDidFinishWithError: ErrorEvent?

    func change() {
        DispatchQueue.main.async {
            self.onChange?()
        }
    }
    
    func loadDidStart(withStatus: String? = nil) {
        DispatchQueue.main.async {
            self.isLoading = true
            Util.shared.showHud()
            self.onLoadDidStart?()
        }
    }
    
    func loadDidFinish() {
        DispatchQueue.main.async {
            self.isLoading = false
            Util.shared.removeHud()
            self.onLoadDidFinish?()
        }
    }
    
    func loadDidFinishWithError(error: Error) {
        DispatchQueue.main.async {
            self.isLoading = false
            Util.shared.removeHud()
            self.onLoadDidFinishWithError?(error)
        }
    }
    
    func registerNotification(name: NSNotification.Name, selecter: Selector) {
        center.addObserver(self, selector: selecter, name: name, object: nil)
    }
    
    func postNotification(name: NSNotification.Name, userInfo: [AnyHashable : Any]? = nil) {
        center.post(name: name, object: nil, userInfo: userInfo)
    }
        
}
