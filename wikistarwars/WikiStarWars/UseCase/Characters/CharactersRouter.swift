//

//  CharactersRouter.swift
//  WikiStarWars
//
//  Created by KrispiDev on 26/02/23.
//

import Foundation

final class CharactersRouter {
    static func view() -> CharactersView {
        let router = CharactersRouter()
        let viewModel = CharactersViewModel(router: router)
        let view = CharactersView(viewModel: viewModel)

        return view
    }
}
