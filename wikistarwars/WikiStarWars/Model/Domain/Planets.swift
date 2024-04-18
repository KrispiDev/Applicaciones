//
//  Planets.swift
//  WikiStarWars
//
//  Created by KrispiDev on 26/02/23.
//

import Foundation

struct Planets: Decodable {
    var next: String?
    var previous: String?
    let count: Int
    let results: [Planet]?
}

extension Planets: Emptyable {
    static func empty() -> Planets {
        .init(next: nil, previous: nil, count: 0, results: nil)
    }
}

extension Planets: Typeable {
    var type: ElementType {
        .planet
    }

    static func typeElement() -> ElementType {
        .planet
    }
}
