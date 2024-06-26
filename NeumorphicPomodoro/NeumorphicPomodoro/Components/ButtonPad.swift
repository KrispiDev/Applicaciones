//
//  ButtonPad.swift
//  NeumorphicPomodoro
//
//  Created by KrispiDev on 12/4/23.
//

import SwiftUI

struct ButtonPad: View {
    
    @Binding var pomodoroState : PomodoroState
    var showCreation : () -> Void
    var showCancelAlert : () -> Void
    var changeRound : () -> Void
    var disabled : Bool {
        pomodoroState == .Empty
    }
    
    var body: some View {
        HStack(spacing: 5){
           
            Button{
                showCancelAlert()
            }label: {
                Image(systemName: "stop")
                    .font(.title)
                    .foregroundStyle(disabled ? LinearGradient(.gray) : LinearGradient(.purple, .pink))
            }
            .buttonStyle(NeumorphicButtonStyle(width: 70, heigth: 70, shape: RoundedRectangle(cornerRadius: 20)))
            .padding(10)
            .disabled(disabled)
            
            Button{
                if(disabled){
                    showCreation()
                } else {
                    if (pomodoroState == .Paused){
                        pomodoroState = .Playing
                    } else {
                        pomodoroState = .Paused
                    }   
                }
            } label: {
                if(!disabled){
                    Image(systemName: pomodoroState == .Playing ? "pause": "play")
                        .font(.largeTitle)
                        .foregroundStyle(LinearGradient(.purple, .pink))
                } else {
                    Image(systemName: "plus")
                        .font(.largeTitle)
                        .foregroundStyle(LinearGradient(.purple, .pink))
                }
            }
            .buttonStyle(NeumorphicButtonStyle(width: 100, heigth: 100, shape: Circle()))
            .padding(10)
    
           
            Button{
                pomodoroState = .Paused
                changeRound()
            }label: {
                Image(systemName: "forward.end.alt")
                    .font(.title)
                    .foregroundStyle(disabled ? LinearGradient(.gray) : LinearGradient(.purple, .pink))
                
            }
            .buttonStyle(NeumorphicButtonStyle(width: 70, heigth: 70, shape: RoundedRectangle(cornerRadius: 20)))
            .padding(10)
            .disabled(disabled)
            
           
        }
        .frame(maxWidth: 350, maxHeight: 150)
        .applyCardStyle()
        

    }
}

struct ButtonPad_Previews: PreviewProvider {
    static var previews: some View {
        ButtonPad(pomodoroState: .constant(.Empty), showCreation: {}, showCancelAlert: {}, changeRound: {})
    }
}
