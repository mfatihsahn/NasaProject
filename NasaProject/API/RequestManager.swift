//
//  RequestManager.swift
//  NasaProject
//
//  Created by FATIH on 23.02.2021.
//

import Foundation
import Alamofire
import ObjectMapper

struct PhotoRequest : Encodable {
    let carType : String
    let sol : Int
    let page : Int
    let camera : String?
}

class RequestManager {
    
    static var shared = RequestManager()
    
    var isLoading : Bool = false
    
    static let apiUrl = "https://api.nasa.gov/"
    let apiKey = "Dnn2zOy11Tgq7JEftOOsBxp5P1a9Owioa82iCYWZ"
    
    
    func request<T: Mappable>(_ url: URL,_ parameters: [String : Any] = [:], _ method: HTTPMethod = .get,_ httpHeaders: HTTPHeaders? = nil, encoding: ParameterEncoding = URLEncoding.default, success: @escaping (T) -> Void, failure: @escaping (Error) -> () ) {
        var parameters = parameters
        parameters["api_key"]  =  self.apiKey
        
        self.isLoading = true
        Util.internetConnectionChecker { (status) in
            if status {
                AF.request(url, method:method, parameters:parameters, encoding:encoding, headers: httpHeaders)
                    .responseJSON { response in
                        
                        self.isLoading = false
                        
                        if let res = response.value {
                            let json = res as! [String: Any]
                            if let object = Mapper<T>().map(JSON: json) {
                                success(object)
                                return
                            }
                        }else if let error = response.error {
                            failure(error)
                        }
                    }
            }
            
            else{
                self.isLoading = false
            }
        }
    }
}
