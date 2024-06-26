//
//  Vehicles.swift
//  WikiStarWars
//
//  Created by KrispiDev on 26/02/23.
//

import Foundation

struct Vehicles: Decodable {
    var next: String?
    var previous: String?
    let count: Int
    let results: [Vehicle]?
}

extension Vehicles: Emptyable {
    static func empty() -> Vehicles {
        .init(next: nil, previous: nil, count: 0, results: nil)
    }
}

extension Vehicles: Typeable {
    var type: ElementType {
        .vehicle
    }

    static func typeElement() -> ElementType {
        .vehicle
    }
}
