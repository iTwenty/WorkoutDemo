//
//  WorkoutDemoApp.swift
//  WorkoutDemo
//
//  Created by Jaydeep Joshi on 18/12/24.
//

import SwiftUI

struct Workout: Codable, Identifiable, Hashable {
    let id: UUID
    var startDate: Date
    var endDate: Date
    var distanceKms: Double?
    var energyBurnedKcals: Double?
    var deviceModel: String?
    var deviceSystemImageName: String?
    var type: String
    var source: String

    static let workouts: [Workout] = (0..<100).map { index in
        let startDate = Calendar.current.startOfDay(for: Date()).addingTimeInterval(TimeInterval(index * 1800))
        let endDate = startDate.addingTimeInterval(900)
        let type = ["Cycling", "Running", "Hiking"].randomElement()!
        let source = "Apple Watch"
        return Workout(id: UUID(), startDate: startDate, endDate: endDate, distanceKms: 5,
                       deviceSystemImageName: "applewatch", type: type, source: source)
    }

    var typeImage: String {
        switch type {
        case "Cycling": "figure.outdoor.cycle"
        case "Running": "figure.run"
        case "Hiking":  "figure.hiking"
        default: "figure.run"
        }
    }
}

@main
struct WorkoutDemoApp: App {
    var body: some Scene {
        WindowGroup {
            TabView {
                workoutsTab
                settingsTab
            }
        }
    }

    @ViewBuilder private var workoutsTab: some View {
        NavigationStack {
            WorkoutsScreen()
                .navigationTitle("MergeFit")
                .navigationBarTitleDisplayMode(.inline)
        }
        .tabItem {
            Label("Workouts", systemImage: "figure.play")
        }
    }

    @ViewBuilder private var settingsTab: some View {
        NavigationStack {
            Text("Settings")
                .navigationTitle("Settings")
        }
        .tabItem {
            Label("Settings", systemImage: "gearshape")
        }
    }
}
