//
//  MenuViewModel.swift
//  QuizApp
//
//  Created by KrispiDev on 05/3/23.
//

import Foundation

protocol MenuViewModelProtocol {
    func showGameView() -> GameView
    func showLeaderboardView() -> LeaderboardView
}

final class MenuViewModel: ObservableObject {
    
    @Published var viewObject: Menu.ViewObject!
    
    private let router: MenuRouter!
    
    init(router: MenuRouter) {
        self.router = router
        prepareView()
    }
    
    // MARK: - Private Methods
    
    private func prepareView() {
        viewObject = Menu.ViewObject(title: "Cuestionario de Harry Potter",
                                     play: "JUGAR",
                                     leaderboard: "PUNTUACIONES",
                                     settings: "OPCIONES")
    }
    
}

// MARK: - MenuViewModelProtocol
extension MenuViewModel: MenuViewModelProtocol {
    
    func showGameView() -> GameView {
        return router.gameView()
    }
    
    func showLeaderboardView() -> LeaderboardView {
        return router.leaderboardView()
    }
    
}
