//
//  SettingsView.swift
//  SleepTracker
//
//  Created by SwiftlyDev on 18/01/2025.
//

import SwiftUI

struct SettingsView: View {
    @StateObject private var settingsViewModel = SettingsViewModel()
    @State var hours: Int = 0
    @State var minutes: Int = 0
    
    var body: some View {
        NavigationStack {
            Form {
                Section {
                    TextField("Username", text: $settingsViewModel.username)
                    TextField("Email", text: $settingsViewModel.email)
                    Toggle("Notifications", isOn: $settingsViewModel.isNotificationsEnabled)
                } header: {
                    Text("Profile")
                }
                
                Section {
                    NavigationLink("Sleep duration", destination: SleepChartView())
                    Text("Achievements")
                    HStack {
                        Picker("My goal", selection: $hours) {
                            ForEach(0..<12, id: \.self) { i in
                                Text("\(i) hours").tag(i)
                            }
                        }
                        .pickerStyle(.navigationLink)
                        
                        Picker("", selection: $minutes) {
                            ForEach(0..<60, id: \.self) { i in
                                Text("\(i) min").tag(i)
                            }
                        }
                        .pickerStyle(.navigationLink)
                        .frame(maxWidth: 80)
                    }
                } header: {
                    Text("Sleeping")
                }
                
                Section {
                    Text("About")
                } header: {
                    Text("General")
                }
            }
            .navigationTitle("Settings")
        }
    }
}

#Preview {
    NavigationStack {
        SettingsView()
    }
}
