//
//  SideBarView.swift
//  twitterClone
//
//  Created by Darío Gallegos on 20/6/22.
//

import SwiftUI

struct SideBar: View {
    @Binding var showMenu: Bool
    
    var body: some View {
        VStack(alignment: .leading) {
            SideMenuHeader
            //body view
            ScrollView(.vertical, showsIndicators: false) {
                VStack(alignment: .leading) {
                    //Tabs
                    TabButton(title: "Perfil", icon: "profile")
                    TabButton(title: "Listas", icon: "list")
                    TabButton(title: "Temas", icon: "topics")
                    TabButton(title: "Elementos guardados", icon: "bookmark")
                    TabButton(title: "Momentos", icon: "moments")
                    
                    Divider()
                    
                    TabButton(title: "Configuración y privacidad", icon: "")
                    TabButton(title: "Centro de ayuda", icon: "")
                }
            }
            
            SideMenuFooter
        }
        .frame(width: Utils.sideBarWidth)
        .frame(maxHeight: .infinity)
        .background(
            Color.primary
                .opacity(0.05)
                .ignoresSafeArea(.container, edges: .vertical)
        )
        .frame(maxWidth: .infinity, alignment: .leading)
    }
    
    @ViewBuilder
    var SideMenuHeader: some View {
        VStack(alignment: .leading, spacing: 8) {
            Image("dario")
                .resizable()
                .aspectRatio(contentMode: .fill)
                .frame(width: 65, height: 65)
                .clipShape(Circle())
                .padding(.vertical, 4)
            Text("Darío Gallegos")
                .font(.title2.bold())
            Text("@_dgallegos_dario")
                .font(.callout)
                .opacity(0.7)
            HStack(spacing: 12) {
                LabeButton(text: "Siguiendo", number: "14", action: {
                    print("Siguiendo")
                })
                LabeButton(text: "Seguidores", number: "4", action: {
                    print("Siguiendo")
                })
            }
            .padding(.vertical, 12)
        }
        .frame(maxWidth: .infinity, alignment: .leading)
        .padding(.vertical)
        .padding(.leading)
    }
    
    @ViewBuilder
    func TabButton(title: String, icon: String) -> some View {
        Button {
            
        } label: {
            HStack(spacing: 20) {
                if !icon.isEmpty {
                    Image(icon)
                        .renderingMode(.template)
                        .foregroundColor(.primary)
                }
                Text(title)
                    .font(.headline)
                    .fontWeight(.medium)
                    .foregroundColor(.primary)
            }
            .frame(maxWidth: .infinity, alignment: .leading)
            .padding(.vertical, 12)
            .padding(.leading, 20)
        }
    }
    
    @ViewBuilder
    var SideMenuFooter: some View {
        HStack {
            Button {
                //action
            } label: {
                Image("light")
            }
            
            Spacer()
            
            Button {
                //action
            } label: {
                Image("codeQR")
            }
        }
        .padding()
    }
}

struct SlideMenu_Previews: PreviewProvider {
    static var previews: some View {
        Group {
            SideBar(showMenu: .constant(true))
            SideBar(showMenu: .constant(true))
                .preferredColorScheme(.dark)
        }
    }
}

struct Utils {
    static let sideBarWidth = UIScreen.main.bounds.width - 90
}
