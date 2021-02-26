//
//  Constant.swift
//  NasaProject
//
//  Created by FATIH on 23.02.2021.
//


import Foundation
import UIKit

let www = "https://api.nasa.gov/"
let apiKey = "Dnn2zOy11Tgq7JEftOOsBxp5P1a9Owioa82iCYWZ"
let additionalValues = www + "mars-photos/api/v1/rovers/{car_type}/photos?"
let roverPhotoUrl = additionalValues + "sol={sol_value}&api_key=" + apiKey + "&page={page_count}&camera={camera_type}"

let curiosityCamArray = ["Front Hazard Avoidance Camera","Rear Hazard Avoidance Camera","Mast Camera","Chemistry and Camera Complex","Mars Hand Lens Imager","Mars Descent Imager","Navigation Camera"]
let otherCamArray = ["Front Hazard Avoidance Camera","Rear Hazard Avoidance Camera","Navigation Camera","Panoramic Camera","Miniature Thermal Emission Spectrometer"]

let curiosityCamKeys = ["FHAZ","RHAZ","MAST","CHEMCAM","MAHLI","MARDI","NAVCAM"]
let otherCamKeys = ["FHAZ","RHAZ","NAVCAM","PANCAM","MINITES"]

