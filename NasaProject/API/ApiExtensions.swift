//
//  ApiExtensions.swift
//  NasaProject
//
//  Created by FATIH on 26.02.2021.
//

import Foundation
extension Encodable {
    
    var dictionary: [String: Any] {
        guard let data = try? JSONEncoder().encode(self) else { return [:] }
        return (try? JSONSerialization.jsonObject(with: data, options: .allowFragments)).flatMap { $0 as? [String: Any] } ?? [:]
    }
    
    var toJSONData: Data? {
        return try? JSONEncoder().encode(self)
    }
}
