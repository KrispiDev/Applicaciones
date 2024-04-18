//
//  HomeRouter.swift
//  WikiStarWars
//
//  Created by KrispiDev on 26/02/23.
//

import Foundation

final class HomeRouter {
    static func view() -> HomeView {
        let router = HomeRouter()
        let viewModel = HomeViewModel(router: router)
        let view = HomeView(viewModel: viewModel)

        return view
    }

    func charactersView() -> CharactersView {
        CharactersRouter.view()
    }
}
