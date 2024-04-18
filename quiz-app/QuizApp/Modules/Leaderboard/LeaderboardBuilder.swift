//
//  LeaderboardBuilder.swift
//  QuizApp
//
//  Created by KrispiDev on 05/3/23.
//

import Foundation

final class LeaderboardBuilder {
    
    static func build() -> LeaderboardView {
        
        let viewModel: LeaderboardViewModel = LeaderboardViewModel()
        let view: LeaderboardView = LeaderboardView(viewModel: viewModel)

        return view
    }
    
}
