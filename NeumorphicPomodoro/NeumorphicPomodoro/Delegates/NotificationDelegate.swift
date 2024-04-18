//
//  NotificationDelegate.swift
//  NeumorphicPomodoro
//
//  Created by KrispiDev on 12/4/23.
//

import SwiftUI

class NotificationDelegate: NSObject, ObservableObject, UNUserNotificationCenterDelegate {
    
    @Published var notificationCounter = 0
    @Published var showAlert = false
    
    override init() {
        super.init()
        UNUserNotificationCenter.current().delegate = self
    }
    
    func requestAuthorization() {
        UNUserNotificationCenter.current().requestAuthorization(options: [.alert, .badge, .sound]) { success, error in
            if success {
                print("¡Todo listo!")
            } else if let error = error {
                print(error.localizedDescription)
            }
        }
    }
    
    //This runs when app is in foreground when notification appears
    func userNotificationCenter(_ center: UNUserNotificationCenter, willPresent notification: UNNotification, withCompletionHandler completionHandler: @escaping (UNNotificationPresentationOptions) -> Void) {
        print("Ha entrado en voluntadPresente")
        showAlert = true
        completionHandler([.badge, .banner, .sound])
    }
    
    func userNotificationCenter(_ center: UNUserNotificationCenter, didReceive response: UNNotificationResponse, withCompletionHandler completionHandler: @escaping () -> Void) {
        print("Ha entrado en didReceive")
        if response.actionIdentifier == "Okay" {
            print("Hola")
            print("El contador es " + String(notificationCounter))
            notificationCounter = notificationCounter + 1
            print("El contador comienza ahora " + String(notificationCounter))
        }
        completionHandler()
    }
    
    func createNotification(notificationData: NotificationData, sound: UNNotificationSound? = nil) {
        UNUserNotificationCenter.current().removeAllPendingNotificationRequests()
        
        let content = UNMutableNotificationContent()
        content.title = notificationData.title
        content.subtitle = notificationData.subtitle
        content.sound = sound ?? UNNotificationSound.default

        let trigger = UNTimeIntervalNotificationTrigger(timeInterval: notificationData.timeInterval, repeats: false)

        // choose a random identifier
        let request = UNNotificationRequest(identifier: UUID().uuidString, content: content, trigger: trigger)
        
        UNUserNotificationCenter.current().add(request)
    }
    
    func cancelNotification() {
        UNUserNotificationCenter.current().removeAllPendingNotificationRequests()
    }
}
