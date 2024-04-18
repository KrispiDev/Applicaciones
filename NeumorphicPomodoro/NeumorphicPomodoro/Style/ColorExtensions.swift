//
//  ColorExtensions.swift
//  NeumorphicPomodoro
//
//  Created by KrispiDev on 12/4/23.
//

import SwiftUI

extension Color {
    static let offWhite = Color(red: 225/255, green: 225/255, blue: 235/255)
}

extension LinearGradient {
    init(_ colors: Color...){
        self.init(gradient: Gradient(colors: colors), startPoint: .topLeading, endPoint: .bottomTrailing)
    }
}
