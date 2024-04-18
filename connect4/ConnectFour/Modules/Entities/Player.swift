//
//  Player.swift
//  ConnectFour
//
//  Created by KrispiDev on 15/01/23.
//

import UIKit

struct Player {
    
    // MARK: Properties
    
    let id: String = UUID().uuidString
    let name: String
    let color: TileColor
    let managedByAI: Bool
    
    enum TileColor {
        case red
        case warning
        
        var uiColor: UIColor {
            switch self {
            case .red:
                return Colors.redTile
            case .warning:
                return Colors.warningTile
            }
        }
        
        // TODO: Localize
        
        var displayName: String {
            switch self {
            case .red: return "Red"
            case .warning: return "Warning"
            }
        }
    }
    
    var displayTileImage: UIImage {
        switch color {
        case .red: return UIImage(named: "red_tile")!
        case .warning: return UIImage(named: "yellow_tile")!
        }
    }
}

extension Player: Equatable {
    static func == (lhs: Player, rhs: Player) -> Bool {
        return rhs.id == lhs.id
    }
}
