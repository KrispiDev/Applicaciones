//
//  Storyboard+App.swift
//  ConnectFour
//
//  Created by KrispiDev on 15/01/23.
//

import UIKit

extension UIStoryboard {
    static var main: UIStoryboard {
        return UIStoryboard(name: "Main", bundle: .main)
    }
    
    static var game: UIStoryboard {
        return UIStoryboard(name: "Game", bundle: .main)
    }
    
    static var info: UIStoryboard {
        return UIStoryboard(name: "Info", bundle: .main)
    }
}
