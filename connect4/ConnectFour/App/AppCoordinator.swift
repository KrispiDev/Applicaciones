//
//  AppCoordinator.swift
//  ConnectFour
//
//  Created by KrispiDev on 15/01/23.
//

import UIKit

final class AppCoordinator: Coordinator {
    
    // MARK: Properties
    
    var navigationController: UINavigationController
    
    private let window: UIWindow
    private let mainCoordinator: MainCoordinator
    
    // MARK: Life cycle
    
    init(_ window: UIWindow) {
        self.window = window
        navigationController = UINavigationController()
        mainCoordinator = MainCoordinator(navigationController)
    }
}

// MARK: Navigation

extension AppCoordinator {
    func start() {
        window.rootViewController = navigationController
        window.makeKeyAndVisible()
        
        coordinate(to: mainCoordinator)
    }
}
