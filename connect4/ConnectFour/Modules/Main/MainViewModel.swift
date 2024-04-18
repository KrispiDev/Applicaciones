//
//  MainViewMOdel.swift
//  ConnectFour
//
//  Created by KrispiDev on 15/01/23.
//

import Foundation

final class MainViewModel {
    
    // MARK: Properties
    
    private let coordinator: MainCoordinator
    
    enum GameType {
        case single
        case multiplayer
    }
    
    // MARK: Life cycle
    
    init(coordinator: MainCoordinator) {
        self.coordinator = coordinator
    }
}

extension MainViewModel {
    func showGameView(gameType: GameType) {
        coordinator.showGameView(gameType: gameType)
    }
    
    // TODO: Localize
    
    var playButtonTitle: String {
        return "Jugar"
    }
    
    var titleLabel: String {
        return "¿List@s para divertirsen?"
    }
    
    var subtitleLabel: String {
        return "Juego de conectar cuatro diviertete."
    }
}
