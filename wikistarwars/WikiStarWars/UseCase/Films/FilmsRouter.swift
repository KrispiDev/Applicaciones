//
//  FilmsRouter.swift
//  WikiStarWars
//
//  Created by KrispiDev on 26/02/23.
//

import Foundation

final class FilmsRouter {
    static func view() -> FilmsView {
        let router = FilmsRouter()
        let viewModel = FilmsViewModel(router: router)
        let view = FilmsView(viewModel: viewModel)

        return view
    }
}
