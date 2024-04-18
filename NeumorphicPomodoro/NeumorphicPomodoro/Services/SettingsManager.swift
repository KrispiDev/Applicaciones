//
//  SettingsManager.swift
//  NeumorphicPomodoro
//
//  Created by KrispiDev on 12/4/23.
//

import Foundation

class SettingsManager {

    static func getSettings() -> SettingsWrapper {
        guard let stringifySettings = UserDefaults.standard.data(forKey: "settings") else {
            return SettingsWrapper()
        }
        let decoder = JSONDecoder()
        
        guard let decoded = try? decoder.decode(SettingsWrapper.self, from: stringifySettings) else {
            fatalError("No se pudieron decodificar datos de UserDefaults")
        }
        
        print("Configuraciones cargadas", decoded)
        return decoded
        
    }

    static func saveSettings(_ settings: SettingsWrapper) {
        
        let encoder = JSONEncoder()
        
        guard let encoded = try? encoder.encode(settings) else {
            fatalError("No se pudieron decodificar datos de UserDefaults")
        }
        
        UserDefaults.standard.set(encoded, forKey: "settings")
        
    }
}
