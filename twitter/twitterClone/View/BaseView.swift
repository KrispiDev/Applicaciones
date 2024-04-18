//
//  BaseView.swift
//  twitterClone
//
//  Created by Darío Gallegos on 20/6/22.
//

import SwiftUI

struct BaseView: View {
    @State var showMenu: Bool = false
    @State var hideNav: Bool = false
    @State var currentTab = "home"
    
    //Offset for both drag gesture and showing menu
    @State var offset: CGFloat = 0
    @State var lastStoreOffset: CGFloat = 0
    
    let sideBarWidth = Utils.sideBarWidth
    
    //Gesture offser
    @GestureState var gestureOffset: CGFloat = 0
    
    init() {
        //Hidden UITabBar native
        UITabBar.appearance().isHidden = true
    }
    
    var body: some View {
        ZStack {
            HStack(spacing:0) {
                
                SideBar(showMenu: $showMenu)
                
                VStack(spacing: 0) {
                    TabView(selection: $currentTab) {
                        HomeView(showMenu: $showMenu, hideNav: $hideNav)
                        //.tag("home")
                        Text("search")
                            .tag("search")
                        Text("notifications")
                            .tag("notifications")
                        Text("messages")
                            .tag("messages")
                    }
                    //Custom tabBar
                    TabBar(currentTab: $currentTab)
                }
                .frame(width: getScreenSize().width)
                //BG when menu is showing
                .overlay(
                    SideBackground(showMenu: $showMenu, opacity: ((offset/sideBarWidth) * 0.2))
                )
                
            }
            .frame(width: getScreenSize().width + sideBarWidth)
            .offset(x: -sideBarWidth / 2)
            .offset(x: offset > 0 ? offset : 0)
            //Gesture
            .gesture(
                DragGesture(minimumDistance: 20)
                    .updating($gestureOffset, body: { value, out, _ in
                        out = value.translation.width
                    })
                    .onEnded(onEnded(value:))
            )
        }
        .animation(.easeOut, value: offset == 0)
        .onChange(of: showMenu) { newValue in
            
            if showMenu && offset == 0 {
                offset = sideBarWidth
                lastStoreOffset = offset
            }
            
            if !showMenu && offset == sideBarWidth {
                offset = 0
                lastStoreOffset = 0
            }
        }
        .onChange(of: gestureOffset) { newValue in
            onChange()
        }
    }
    
    func onChange() {
        offset = (gestureOffset != 0) ? (gestureOffset + lastStoreOffset < sideBarWidth ? gestureOffset + lastStoreOffset : offset) : offset
    }
    
    func onEnded(value: DragGesture.Value) {
        
        let translation = value.translation.width
        
        withAnimation {
            //cheking...
            if translation > 0 {
                
                if translation > (sideBarWidth / 2) {
                    //showing menu
                    offset = sideBarWidth
                    showMenu = true
                } else {
                    if offset == sideBarWidth {
                        return
                    }
                    
                    offset = 0
                    showMenu = false
                }
            } else {
                
                if -translation > (sideBarWidth / 2) {
                    offset = 0
                    showMenu = false
                } else {
                    
                    if !showMenu {
                        return
                    }
                    
                    offset = sideBarWidth
                    showMenu = true
                }
            }
        }
        lastStoreOffset = offset
    }
}

struct BaseView_Previews: PreviewProvider {
    static var previews: some View {
        Group {
            BaseView()
            BaseView()
                .preferredColorScheme(.dark)
        }
    }
}
