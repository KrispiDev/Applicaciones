//
//  GameBuilder.swift
//  QuizApp
//
//  Created by KrispiDev on 05/3/23.
//

import Foundation

final class GameBuilder {
    
    static func build() -> GameView {
        
        let router: GameRouter = GameRouter()
        let viewModel: GameViewModel = GameViewModel(router: router)
        let view: GameView = GameView(viewModel: viewModel)

        return view
    }
    
}
