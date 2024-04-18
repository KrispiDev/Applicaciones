//
//  Characters.swift
//  WikiStarWars
//
//  Created by KrispiDev on 26/02/23.
//

import Foundation

struct Characters: Decodable {
    var next: String?
    var previous: String?
    let count: Int
    let results: [People]?
}

extension Characters: Emptyable {
    static func empty() -> Characters {
        .init(next: nil, previous: nil, count: 0, results: nil)
    }
}

extension Characters: Typeable {
    var type: ElementType {
        .people
    }

    static func typeElement() -> ElementType {
        .people
    }
}
