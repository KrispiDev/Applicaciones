//
//  Card.swift
//  MemoryGame
//
//  Created by KrispiDev on 20/5/23.
//

import Foundation

class Card: ObservableObject {
    
    let uuid = UUID().uuidString
    let id: Int
    
    init(id: Int) {
        self.id = id
    }
    
    @Published var flipped = false
    @Published var matched = false
}
