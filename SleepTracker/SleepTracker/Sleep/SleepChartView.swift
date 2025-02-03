//
//  SleepChartView.swift
//  SleepTracker
//
//  Created by SwiftlyDev on 18/01/2025.
//

import SwiftUI
import Charts

struct SleepChartView: View {
    @ObservedObject var homeViewModel = HomeViewModel()
    
    var body: some View {
        NavigationView {
            VStack {
                Picker("Time View", selection: $homeViewModel.timeView) {
                    ForEach(TimeView.allCases, id: \.self) { view in
                        Text(view.rawValue.capitalized).tag(view)
                    }
                }
                .pickerStyle(SegmentedPickerStyle())
                .padding()
                .onChange(of: homeViewModel.timeView) {
                    homeViewModel.filterSleepData()
                }
                
                Chart {
                    RuleMark(y: .value("Goal", 7.5))
                        .lineStyle(StrokeStyle(lineWidth: 1, dash: [5]))
                        .annotation(alignment: .leading) {
                            Text("Goal")
                                .font(.caption)
                                .foregroundColor(.secondary)
                        }
                    
                    ForEach(homeViewModel.filteredSleepData) { data in
                        BarMark(
                            x: .value("Date", data.date, unit: .day),
                            y: .value("Sleep Duration", data.sleepDuration)
                        )
                        .foregroundStyle(.blue.gradient)
                    }
                }
                .frame(height: 300)
                .chartYScale(domain: 0...8)
                .padding()
                
                Spacer()
            }
            .navigationTitle("Sleep Duration")
        }
    }
}

#Preview {
    SleepChartView()
}
