//
//  ScoreViewModel.swift
//  ConnectFour
//
//  Created by KrispiDev on 15/01/23.
//

import UIKit

struct ScoreViewModel {
    
    // MARK: Properties
    
    private let leftScore: String
    private let rightScore: String
    private let leftPlayer: Player
    private let rightPlayer: Player
    private let turn: Turn
    
    // MARK: Life cycle
    
    init(leftScore: String, rightScore: String, leftPlayer: Player, rightPlayer: Player, turn: Turn) {
        self.leftScore = leftScore
        self.rightScore = rightScore
        self.leftPlayer = leftPlayer
        self.rightPlayer = rightPlayer
        self.turn = turn
    }
    
    enum Turn {
        case left
        case right
    }
}

extension ScoreViewModel {
    var leftImage: UIImage? {
        return leftPlayer.displayTileImage
    }
    
    var leftName: String {
        return leftPlayer.name
    }
    
    var score: String {
        return "\(leftScore):\(rightScore)"
    }
    
    var leftIndicatorColor: UIColor {
        switch turn {
        case .left: return leftPlayer.color.uiColor
        case .right: return .clear
        }
    }
    
    var rightImage: UIImage? {
        return rightPlayer.displayTileImage
    }
    
    var rightName: String {
        return rightPlayer.name
    }
    
    var rightIndicatorColor: UIColor {
        switch turn {
        case .left: return .clear
        case .right: return rightPlayer.color.uiColor
        }
    }
}
