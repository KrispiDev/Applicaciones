//
//  Reusable.swift
//  ConnectFour
//
//  Created by KrispiDev on 15/01/23.
//

import UIKit

protocol Reusable {
    static var reuseIdentifier: String { get }
}

extension Reusable {
    static var reuseIdentifier: String {
        return String(describing: self)
    }
}

extension UIView: Reusable { }
extension UIViewController: Reusable { }
