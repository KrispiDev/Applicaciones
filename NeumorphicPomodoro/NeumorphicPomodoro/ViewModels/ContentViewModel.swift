//
//  ContentViewModel.swift
//  NeumorphicPomodoro
//
//  Created by KrispiDev on 12/4/23.
//

import Combine
import SwiftUI

extension ContentView {
    
     class ViewModel: ObservableObject {
         
        @Published var currentSession = Session()
        @Published var isTimerWorking = false
        var timer: Timer.TimerPublisher = Timer.publish(every: 1, on: .main, in: .common)
        var connectedTimer: Cancellable? = nil
        let delegate = NotificationDelegate()
        
        var remainingClock : String {
            let formatter = DateComponentsFormatter()
            formatter.allowedUnits = [.minute, .second]
            formatter.unitsStyle = .positional
            formatter.zeroFormattingBehavior = .pad
            return formatter.string(from: TimeInterval(currentSession.timeRemaining))!
        }
        
        var tickingAmount : Double {
            Double(currentSession.timeRemaining) / Double(currentSession.currentRoundInterval) * 360
        }
        
         func createSession(_ settings: SettingsWrapper) {
            currentSession.currentRound += 1
            currentSession.longRestCadence = settings.settings.longRestCadence
            currentSession.longRestLength = settings.settings.longRestLengthSeconds
             currentSession.basicRestLength = Double(settings.settings.basicRestLength)
             currentSession.basicPomodoroLength = Double(settings.settings.basicPomodoroLength)
            currentSession.timeRemaining = Int(settings.settings.basicPomodoroLengthSeconds)
            currentSession.currentRoundInterval = settings.settings.basicPomodoroLengthSeconds
        }
        
         func changeRound (_ settings: SettingsWrapper) {
            if(currentSession.currentIntervalType == .pomodoro){
                currentSession.currentIntervalType = .rest
            } else {
                currentSession.currentIntervalType = .pomodoro
                currentSession.currentRound += 1
            }
            
            currentSession.currentRoundInterval = getRoundFullTime(settings)
            currentSession.timeRemaining = Int(getRoundFullTime(settings))
        }
        
        func changeTaskType() {
            currentSession.taskType = currentSession.taskType == .work ? .personal : .work
        }
         
         func instantiateTimer(_ settings: SettingsWrapper) {
             
             if(currentSession.timeRemaining > 0){
                 delegate.createNotification(notificationData: buildNotification())
             }
             self.timer = Timer.publish(every: 1, on: .main, in: .common)
             self.connectedTimer = self.timer.connect()
             isTimerWorking = true
             return
        }
             
        func cancelTimer() {
            delegate.cancelNotification()
            self.connectedTimer?.cancel()
            isTimerWorking = false
            return
        }
         
         func buildNotification() -> NotificationData {
             let title = currentSession.currentIntervalType == .pomodoro ? "Pomodoro \(currentSession.currentRound) completed" : "Rest \(currentSession.currentRound) is over"
             let message = currentSession.currentIntervalType == .pomodoro ? "Es hora de que descanses" : "¡Trabajemos un poco!"
             
             let interval = Double(currentSession.timeRemaining)
             
             return NotificationData(title: title, subtitle: message, timeInterval: interval)
         }
         
         func getRoundFullTime(_ settings: SettingsWrapper) -> Double {
             return currentSession.currentIntervalType == .pomodoro ? settings.settings.basicPomodoroLengthSeconds : currentSession.currentRound % currentSession.longRestCadence == 0 ? currentSession.longRestLength : settings.settings.basicRestLengthSeconds
         }
         
    }
}
