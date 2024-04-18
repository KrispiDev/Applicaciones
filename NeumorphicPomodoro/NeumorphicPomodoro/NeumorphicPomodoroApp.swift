//
//  NeumorphicPomodoroApp.swift
//  NeumorphicPomodoro
//
//  Created by KrispiDev on 12/4/23.
//

import SwiftUI

@main
struct NeumorphicPomodoroApp: App {
    @StateObject var settings = SettingsManager.getSettings()
    @StateObject var dataController = DataController()
    var body: some Scene {
        WindowGroup {
            ContentView()
                .environmentObject(settings)
                .environment(\.managedObjectContext, dataController.container.viewContext)
        }
    }
}
