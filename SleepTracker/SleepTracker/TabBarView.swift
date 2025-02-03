//
//  TabBarView.swift
//  SleepTracker
//
//  Created by SwiftlyDev on 18/01/2025.
//

import SwiftUI

struct TabBarView: View {
    @State private var selectedTab = 0
    
    var body: some View {
        TabView(selection: $selectedTab) {
            HomeView()
                .tabItem {
                    Image(systemName: "house")
                    Text("Home")
                }
                .onAppear { selectedTab = 0 }
                .tag(0)
            
            SleepChartView()
                .tabItem {
                    Image(systemName: "moon")
                    Text("Sleep")
                }
                .onAppear { selectedTab = 1 }
                .tag(1)
            
            SettingsView()
                .tabItem {
                    Image(systemName: "gearshape")
                    Text("Settings")
                }
                .onAppear { selectedTab = 2 }
                .tag(2)
        }
    }
}


#Preview {
    TabBarView()
}
