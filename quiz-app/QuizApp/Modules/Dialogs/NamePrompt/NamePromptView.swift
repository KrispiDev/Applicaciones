//
//  NamePromptView.swift
//  QuizApp
//
//  Created by KrispiDev on 05/3/23.
//

import SwiftUI

struct NamePromptView: View {
    
    @ObservedObject var viewModel: NamePromptViewModel
    
    var body: some View {
        if viewModel.isShown {
            ZStack {
                Color.black.opacity(0.5).ignoresSafeArea()
                
                VStack {
                    Image(systemName: "hands.clap.fill")
                        .font(.largeTitle)
                        .padding(.bottom, 8)
                        .foregroundColor(.init(hex: "#FCD0B4"))
                    Text(viewModel.message)
                    Spacer()
                    HStack {
                        TextField("Cual es tu nombre", text: $viewModel.name)
                            .padding(.vertical, 4)
                            .padding(.horizontal, 8)
                            .cornerRadius(4)
                            .overlay(
                                RoundedRectangle(cornerRadius: 4)
                                    .stroke(lineWidth: 2)
                                    .foregroundColor(Color.white)
                            )
                        Button(action: viewModel.confirmTapped) {
                            Image(systemName: "checkmark.circle.fill")
                                .foregroundColor(Color.white)
                                .font(.system(size: 28))
                        }
                    }
                }
                .padding(40)
                .frame(width: UIScreen.main.bounds.width - 50, height: 250)
                .background(Color.customGray)
                .cornerRadius(8)
                .overlay(
                    RoundedRectangle(cornerRadius: 8)
                        .stroke(lineWidth: 2)
                        .foregroundColor(Color.white)
                )
            }
        }
    }
}

struct NamePromptView_Previews: PreviewProvider {
    static var previews: some View {
        NamePromptBuilder.build(points: 75, isShown: true, onDone: { _ in })
            .preferredColorScheme(.dark)
    }
}
