//
//  Starships.swift
//  WikiStarWars
//
//  Created by KrispiDev on 26/02/23.
//

import Foundation

struct Starships: Decodable {
    var next: String?
    var previous: String?
    let count: Int
    let results: [Starhip]?
}

extension Starships: Emptyable {
    static func empty() -> Starships {
        .init(next: nil, previous: nil, count: 0, results: nil)
    }
}

extension Starships: Typeable {
    var type: ElementType {
        .starShip
    }

    static func typeElement() -> ElementType {
        .starShip
    }
}
