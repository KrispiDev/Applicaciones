//
//  HomeViewModel.swift
//  WikiStarWars
//
//  Created by KrispiDev on 26/02/23.
//

import Foundation
import SwiftUI

final class HomeViewModel: ObservableObject {
    private let router: HomeRouter

    init(router: HomeRouter) {
        self.router = router
    }
}
