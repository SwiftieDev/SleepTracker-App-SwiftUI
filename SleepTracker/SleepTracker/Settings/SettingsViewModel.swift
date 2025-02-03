//
//  SettingsViewModel.swift
//  SleepTracker
//
//  Created by SwiftlyDev on 18/01/2025.
//

import SwiftUI
import UserNotifications

class SettingsViewModel: ObservableObject {
    @Published var username: String = ""
    @Published var email: String = ""
    @Published var isNotificationsEnabled: Bool = false {
        didSet {
            if isNotificationsEnabled {
                enableNotifications()
            }
        }
    }
    
    private func enableNotifications() {
        UNUserNotificationCenter.current().requestAuthorization(options: [.alert, .badge, .sound]) { success, error in
            if success {
                print("All set!")
            } else if let error = error {
                print(error.localizedDescription)
            }
        }
    }
}
