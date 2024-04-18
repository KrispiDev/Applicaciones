//
//  PomodoroSession+CoreDataProperties.swift
//  NeumorphicPomodoro
//
//  Created by KrispiDev on 12/4/23.
//
//

import Foundation
import CoreData


extension PomodoroSession {

    @nonobjc public class func fetchRequest() -> NSFetchRequest<PomodoroSession> {
        return NSFetchRequest<PomodoroSession>(entityName: "PomodoroSession")
    }

    @NSManaged public var numberOfPomodoros: Int16
    @NSManaged public var numberOfRests: Int16
    @NSManaged public var date: Date?
    @NSManaged public var task: String?
    @NSManaged public var type: String?
    @NSManaged public var totalTime: Int32
    @NSManaged public var pomodoroLength: Int16
    @NSManaged public var restLenght: Int16
    @NSManaged public var restCadence: Int16
    @NSManaged public var longRestLength: Int16
    
    var unwrappedTask : String {
        return task ?? ""
    }
    
    var unwrappedType : String {
        return type ?? ""
    }
    
    var unwrappedDate : Date {
        Calendar.current.startOfDay(for: date ?? Date.distantPast)
    }

}

extension PomodoroSession : Identifiable {

}
