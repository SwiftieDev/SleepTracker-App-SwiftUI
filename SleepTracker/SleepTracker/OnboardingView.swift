//
//  OnboardingView.swift
//  SleepTracker
//
//  Created by SwiftlyDev on 18/01/2025.
//

import SwiftUI

struct OnboardingView: View {
    @AppStorage("isOnboarding") var isOnboarding: Bool = true
    
    var body: some View {
        if isOnboarding {
            NavigationStack {
                TabView {
                    VStack() {
                        Image("Logo design")
                            .resizable()
                            .scaledToFit()
                        
                        VStack(spacing: 15) {
                            Text("Track Your Sleep Pattern and Improve it")
                                .font(.title)
                                .fontWeight(.bold)
                            Text("Get insights into your sleep patterns and wake up refreshed with Sleep Tracker")
                                .font(.subheadline)
                            
                            Button("Get Started") {
                                isOnboarding.toggle()
                            }
                            .frame(width: 384, height: 55)
                            .cornerRadius(20)
                            .font(.title2)
                            .background(Color.primary)
                            .foregroundColor(.white)
                            .frame(width: 325, height: 55)
                            .cornerRadius(10)
                            
                            VStack{
                                Text("By continuing, you agree to SleepTracker's " + "\n") +
                                Text("Terms of Service").bold() +
                                Text(" and ") +
                                Text("Privacy Policy.").bold()
                            }
                            .font(.footnote)
                            .foregroundColor(.secondary)
                            .multilineTextAlignment(.center)
                        }
                        .padding()
                    }
                    .padding()
                }
                .navigationTitle("Sleep Stracker")
                .navigationBarTitleDisplayMode(.inline)
                .tabViewStyle(.automatic)
            }
        } else {
            TabBarView()
        }
    }
}


#Preview {
    OnboardingView()
}
