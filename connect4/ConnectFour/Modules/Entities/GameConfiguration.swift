//
//  GameConfiguration.swift
//  ConnectFour
//
//  Created by KrispiDev on 15/01/23.
//

import Foundation

struct GameConfiguration {
    
    // MARK: Properties
    
    let size: SizeInt
    let gameMode: GameMode
    
    enum GameMode {
        case single
        case multiplayer
    }
    
    var boardWidth: Int {
        return Int(size.width)
    }
    
    var boardHeight: Int {
        return Int(size.height)
    }
}
