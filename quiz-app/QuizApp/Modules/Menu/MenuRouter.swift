//
//  MenuRouter.swift
//  QuizApp
//
//  Created by KrispiDev on 05/3/23.
//

import Foundation

protocol MenuRouterProtocol {
    func gameView() -> GameView
    func leaderboardView() -> LeaderboardView
}

final class MenuRouter: MenuRouterProtocol {
    
    func gameView() -> GameView {
        return GameBuilder.build()
    }
    
    func leaderboardView() -> LeaderboardView {
        return LeaderboardBuilder.build()
    }
    
}
