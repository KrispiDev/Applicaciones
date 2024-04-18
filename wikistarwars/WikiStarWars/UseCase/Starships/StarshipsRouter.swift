//
//  StarshipsRouter.swift
//  WikiStarWars
//
//  Created by KrispiDev on 26/02/23.
//

import Foundation

final class StarshipsRouter {
    static func view() -> StarshipsView {
        let router = StarshipsRouter()
        let viewModel = StarshipsViewModel(router: router)
        let view = StarshipsView(viewModel: viewModel)

        return view
    }
}
