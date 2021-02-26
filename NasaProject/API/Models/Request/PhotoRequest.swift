//
//  RequestModel.swift
//  NasaProject
//
//  Created by FATIH on 26.02.2021.
//

import Foundation

struct PhotoRequest : Encodable {
    let carType : String
    let sol : Int
    let page : Int
    let camera : String?
}
