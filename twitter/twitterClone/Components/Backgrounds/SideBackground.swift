//
//  SideBarBackground.swift
//  twitterClone
//
//  Created by Darío Gallegos on 23/6/22.
//

import SwiftUI

struct SideBackground: View {
    @Binding var showMenu: Bool
    var opacity: Double = 0
    
    var body: some View {
        Rectangle()
            .fill(
                Color.primary
                    .opacity(opacity)
            )
            .ignoresSafeArea(.container, edges: .vertical)
            .onTapGesture {
                withAnimation {
                    showMenu.toggle()
                }
            }
    }
}

struct SideBackground_Previews: PreviewProvider {
    static var previews: some View {
        SideBackground(showMenu: .constant(true))
    }
}
