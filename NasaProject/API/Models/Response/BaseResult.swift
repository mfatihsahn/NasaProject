//
//  BaseResult.swift
//  NasaProject
//
//  Created by FATIH on 23.02.2021.
//


import Foundation
import ObjectMapper

class BaseResult<T: Mappable> : Mappable {

    var photos: [T]?
    
    init()
    {
        
    }
    
    required init?(map: Map){
    
    }

    func mapping(map: Map) {

        if let _ = try? map.value("photos") as [T] {
            photos <- map["photos"]
        }

    }
}
