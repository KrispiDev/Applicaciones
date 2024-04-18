//
//  NotificationContent.swift
//  NeumorphicPomodoro
//
//  Created by KrispiDev on 12/4/23.
//

import Foundation

class NotificationData {
    var title : String
    var subtitle : String
    var timeInterval : Double
    
    init(title: String, subtitle: String, timeInterval: Double){
        self.title = title
        self.subtitle = subtitle
        self.timeInterval = timeInterval
    }
}
