//
//  Reusable+Storyboard.swift
//  ConnectFour
//
//  Created by KrispiDev on 15/01/23.
//

import UIKit

extension UIStoryboard {
    
    func instantiateViewController<T>(ofType type: T.Type = T.self) -> T where T: UIViewController {
        let controller = instantiateViewController(withIdentifier: type.reuseIdentifier)
        
        guard let viewController = controller as? T else {
            fatalError()
        }
        
        return viewController
    }
}
