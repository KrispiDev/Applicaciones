//
//  LeaderboardModel.swift
//  QuizApp
//
//  Created by KrispiDev on 05/3/23.
//

import Foundation

struct Leaderboard {
    
    struct ViewObject {
        var ranking: [Rank]
        
        init() {
            ranking = []
        }
    }
    
    struct Rank: Codable, Hashable, Identifiable {
        var id: Int
        var name: String
        var points: Int
    }
    
}
