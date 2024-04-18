//
//  Header.swift
//  NeumorphicPomodoro
//
//  Created by KrispiDev on 12/4/23.
//

import SwiftUI

struct Header: View {
    var body: some View {
        HStack(alignment: .lastTextBaseline, spacing: 20){
            Text("""
                Pomodoro
                Slac
                """)
                .font(.largeTitle.bold())
                .foregroundColor(.black.opacity(0.8))
                .lineLimit(2)
                .minimumScaleFactor(0.5)
            
            Text("""
                La aplicación
                para que tú
                trabajo sea mejor
                """)
                .font(.title3)
                .foregroundColor(.gray)
        }
    }
}

struct Header_Previews: PreviewProvider {
    static var previews: some View {
        Header()
    }
}
