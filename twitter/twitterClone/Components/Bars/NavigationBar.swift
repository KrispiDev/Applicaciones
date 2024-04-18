//
//  NavigationBar.swift
//  twitterClone
//
//  Created by Darío Gallegos on 22/6/22.
//

import SwiftUI

struct NavigationBar: View {
    @Binding var hideBar: Bool
    var leftButton: (() -> Void)?
    var rightButton: (() -> Void)?

    private let heightNavBar : CGFloat = 45
    
    var body: some View {
        ZStack {
            Color.clear
                .background(.ultraThinMaterial)
            HStack(spacing:0) {
                Button {
                    leftButton?()
                } label: {
                    Image("dario")
                        .resizable()
                        .aspectRatio(contentMode: .fill)
                        .clipShape(Circle())
                        .frame(width: 32, height: 32)
                }
                Spacer()
                Button {
                    
                } label: {
                    Image("logo")
                }
                Spacer()
                Button {
                    rightButton?()
                } label: {
                    Image("feature")
                }
                
            }
            .padding(.horizontal, 24)
            .opacity(hideBar ? 0 : 1)
        }
        .frame(height: heightNavBar)
        .frame(maxHeight: .infinity, alignment: .top)
        .offset(y: hideBar ? -heightNavBar : 0)
    }
}

struct NavigationBar_Previews: PreviewProvider {
    static var previews: some View {
        NavigationBar(hideBar: .constant(true))

    }
}
