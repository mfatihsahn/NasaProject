//
//  Util.swift
//  NasaProject
//
//  Created by FATIH on 23.02.2021.
//


import Foundation
import UIKit
import ASProgressHud
import SystemConfiguration

typealias InternetConnectionChecker = (_ status: Bool) -> Void

class Util
{
    static var shared = Util()
    
   /* func encodeUrl(_ url : String) -> String
    {
        return url.addingPercentEncoding(withAllowedCharacters: .urlQueryAllowed)!
    }*/
    
    func showHud()
    {
        removeHud()
        let view = mainDelegate.window!
        let show = ASProgressHud.showHUDAddedTo(view, animated: true, type: .default)
        let tap: UITapGestureRecognizer = UITapGestureRecognizer(target: self, action: #selector(dismissLoading))
        show.addGestureRecognizer(tap)
    }
    
    @objc func dismissLoading(recognizer: UITapGestureRecognizer)
    {
        removeHud()
    }
    
    func removeHud()
    {
        let view = mainDelegate.window!
        _ = ASProgressHud.hideAllHUDsForView(view, animated: true)
    }
    
    
    public static func isConnectedToInternet() -> Bool{
        var zeroAddress = sockaddr_in()
        zeroAddress.sin_len = UInt8(MemoryLayout<sockaddr_in>.size)
        zeroAddress.sin_family = sa_family_t(AF_INET)
        
        guard let defaultRouteReachability = withUnsafePointer(to: &zeroAddress, {
            $0.withMemoryRebound(to: sockaddr.self, capacity: 1) {
                SCNetworkReachabilityCreateWithAddress(nil, $0)
            }
        }) else {
            return false
        }
        
        var flags: SCNetworkReachabilityFlags = []
        if !SCNetworkReachabilityGetFlags(defaultRouteReachability, &flags) {
            return false
        }
        
        let isReachable = flags.contains(.reachable)
        let needsConnection = flags.contains(.connectionRequired)
        
        return (isReachable && !needsConnection)
    }
    public static func internetConnectionChecker(callback: @escaping InternetConnectionChecker){
        if Util.isConnectedToInternet() {
            callback(true)
        }else{
            callback(false)
        }
    }

  
}

