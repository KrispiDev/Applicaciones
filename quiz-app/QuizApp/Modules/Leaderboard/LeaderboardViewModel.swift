//
//  LeaderboardViewModel.swift
//  QuizApp
//
//  Created by KrispiDev on 05/3/23.
//

import Foundation
import SwiftUI

protocol LeaderboardViewModelProtocol {
    func onAppear(_ presentation: Binding<PresentationMode>)
}

final class LeaderboardViewModel: ObservableObject {
    
    @Published var viewObject: Leaderboard.ViewObject!
    
    private var presentation: Binding<PresentationMode>!
    
    init() {
        prepareView()
    }
    
    private func prepareView() {
        viewObject = Leaderboard.ViewObject()
    }
    
    // MARK: - Private Methods
    
}

// MARK: - LeaderboardViewModelProtocol
extension LeaderboardViewModel: LeaderboardViewModelProtocol {
    
    func onAppear(_ presentation: Binding<PresentationMode>) {
        self.presentation = presentation
        viewObject.ranking = RankingManager.shared.getRankingFromMemory()
    }
    
}
