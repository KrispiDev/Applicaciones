//
//  CharactersView.swift
//  WikiStarWars
//
//  Created by KrispiDev on 26/02/23.
//

import SwiftUI

struct CharactersView: View {
    @ObservedObject var viewModel: CharactersViewModel
    
    private(set) var autoLoad: Bool = true
    @State var charHomeWorld: String = ""
    
    var body: some View {
        GridView(delegate: self) {
            ForEach(viewModel.items, id: \.id) { (element: People) in
                NavigationLink {
                    GridDetailView(element: element) {
                        VStack(alignment: .leading, spacing: 8) {
                            HStack {
                                Text("Birth Year").foregroundColor(.gray).bold()
                                Text("\(element.birthYear)").font(.body)
                                Spacer()
                                Text("Gender").foregroundColor(.gray).bold()
                                Text("\(element.gender)").font(.body)
                            }
                            HStack {
                                Text("Height").foregroundColor(.gray).bold()
                                Text(UIUtils.parseNumberFormatString(element.height, unit: "cm")).font(.body)
                                Spacer()
                                Text("Mass").foregroundColor(.gray).bold()
                                Text(UIUtils.parseNumberFormatString(element.mass, unit: "kg")).font(.body)
                            }
                            HStack {
                                Text("Hair Color").foregroundColor(.gray).bold()
                                Text("\(element.hairColor)").font(.body)
                                Spacer()
                                Text("Skin Color").foregroundColor(.gray).bold()
                                Text("\(element.skinColor)").font(.body)
                            }
                            VStack(alignment: .leading, spacing: 8) {
                                if !charHomeWorld.isEmpty {
                                    Text("Homeworld").foregroundColor(.gray).bold()
                                    Text("\(charHomeWorld)").font(.body)
                                } else {
                                    Text("  ")
                                    Text("  ")
                                }
                            }.task {
                                viewModel.loadHomeWorld(element: element, binding: $charHomeWorld)
                            }
                        }.padding().frame(maxWidth: .infinity, alignment: .leading).lineLimit(nil).multilineTextAlignment(.leading).fixedSize(horizontal: false, vertical: true)
                            .frame(maxWidth: .infinity)
                    }
                } label: {
                    GridCellView(element: element)
                }.task {
                    if element == viewModel.last, autoLoad {
                        viewModel.loadMore()
                    }
                }
            }
        }
    }
}

extension CharactersView: SearchDelegate {
    var placeHolder: String {
        "Find your favorite character"
    }
    
    func search(query: String) {
        viewModel.search(query: query)
    }
}

extension CharactersView: GridViewDelegate {
    var title: String {
        ElementType.people.title
    }
    
    func all(finished: @escaping (Bool) -> Void) {
        viewModel.all(finished: finished)
    }
    
    func more() {
        viewModel.loadMore()
    }
    
    func hasNext() -> Bool {
        return viewModel.hasNext()
    }
    
    func isAutoLoad() -> Bool {
        autoLoad
    }
}

struct CharactersView_Previews: PreviewProvider {
    static var previews: some View {
        CharactersRouter.view()
    }
}
