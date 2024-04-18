//
//  HomeView.swift
//  twitterClone
//
//  Created by Darío Gallegos on 21/6/22.
//

import SwiftUI


struct HomeView: View {
    @Binding var showMenu: Bool
    @Binding var hideNav: Bool
    //Two state for holding the current offset and previous offset
    @State var offset: CGFloat = .zero
    @State var lastOffset: CGFloat = .zero
    
    let durationOffset: CGFloat = 35
    
    let tweetsList = TweetsList()
    
    var body: some View {
        ScrollView() {
            GeometryReader { geo in
                Rectangle()
                    .frame(width: 0, height: 0)
                    .onAppear {
                        offset = geo.frame(in: .global).midY
                    }
                    .onChange(of: geo.frame(in: .global).midY) { midY in
                        DispatchQueue.main.async {
                            onChangeOffset(midY: midY)
                        }
                    }
            }
            
            VStack {
                ForEach(0..<tweetsList.list.count, id:\.self) { item in
                    TweetRow(tweet: tweetsList.list[item])
                }
            }
            .padding(.top, 45)
        }
        .overlay(
            NavigationBar(hideBar: $hideNav, leftButton: {
                showMenu.toggle()
            })
        )
        .overlay {
            AddTweetButton()
        }
    }
    
    func onChangeOffset(midY: CGFloat) {
        if (midY < offset) {
            if offset < 0 && -midY > (lastOffset + durationOffset) {
                withAnimation(.easeOut) {
                    hideNav = true
                }
                lastOffset = -offset
            }
        }
        
        if (midY > offset && -midY < (lastOffset - durationOffset)) {
            withAnimation(.easeOut) {
                hideNav = false
            }
            lastOffset = -offset
        }
        offset = midY
    }
}

struct HomeView_Previews: PreviewProvider {
    static var previews: some View {
        HomeView(showMenu: .constant(true), hideNav: .constant(false))
    }
}
