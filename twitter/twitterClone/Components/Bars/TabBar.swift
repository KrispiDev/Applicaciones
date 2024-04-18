//
//  TabBar.swift
//  twitterClone
//
//  Created by Darío Gallegos on 21/6/22.
//

import SwiftUI

struct TabBar: View {
    @Binding var currentTab: String
    
    var body: some View {
        VStack(spacing: 0) {
            Divider()
            HStack(spacing: 0) {
                TabButton(image: "home")
                TabButton(image: "search")
                TabButton(image: "notifications")
                TabButton(image: "messages")
            }
            .padding(.vertical)
        }
    }
    
    @ViewBuilder
    func TabButton(image: String) -> some View {
        Button {
            withAnimation {
                currentTab = image
            }
        } label: {
            Image(image)
                .resizable()
                .renderingMode(.template)
                .aspectRatio(contentMode: .fit)
                .frame(width: 22, height: 22)
                .foregroundColor(currentTab == image ? .primary : .gray)
                .frame(maxWidth: .infinity)
        }
    }

}

struct TabBar_Previews: PreviewProvider {
    static var previews: some View {
        TabBar(currentTab: .constant("home"))
    }
}
