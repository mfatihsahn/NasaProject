//
//  Photos.swift
//  NasaProject
//
//  Created by FATIH on 23.02.2021.
//


import Foundation
import ObjectMapper

struct Photos : Mappable {
    var id : Int = 0
    var sol : Int = 0
    var camera : Camera?
    var img_src : String = ""
    var earth_date : String = ""
    var rover : Rover?

    init?(map: Map) {

    }

    mutating func mapping(map: Map) {

        id <- map["id"]
        sol <- map["sol"]
        camera <- map["camera"]
        img_src <- map["img_src"]
        earth_date <- map["earth_date"]
        rover <- map["rover"]
    }

}

struct Rover : Mappable {
    var id : Int = 0
    var name : String = ""
    var landing_date : String = ""
    var launch_date : String = ""
    var status : String = ""

    init?(map: Map) {

    }

    mutating func mapping(map: Map) {

        id <- map["id"]
        name <- map["name"]
        landing_date <- map["landing_date"]
        launch_date <- map["launch_date"]
        status <- map["status"]
    }

}
import ObjectMapper

struct Camera : Mappable {
    var id : Int = 0
    var name : String = ""
    var rover_id : Int = 0
    var full_name : String = ""

    init?(map: Map) {

    }

    mutating func mapping(map: Map) {

        id <- map["id"]
        name <- map["name"]
        rover_id <- map["rover_id"]
        full_name <- map["full_name"]
    }

}
