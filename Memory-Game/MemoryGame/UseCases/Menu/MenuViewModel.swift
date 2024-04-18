//
//  MenuViewModel.swift
//  MemoryGame
//
//  Created by KrispiDev on 20/5/23.
//

import Foundation

final class MenuViewModel {
    
    // Lokalized
    
    let titleTextKey = "app.name"
    let subtitleTextKey = "menu.level.title"
    
    // Public
    
    func randomImageId() -> String {
        return "card-\(Int.random(in: 1...15))"
    }
    
}
