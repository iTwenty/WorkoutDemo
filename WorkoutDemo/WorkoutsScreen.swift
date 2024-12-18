//
//  WorkoutsScreen.swift
//  WorkoutDemo
//
//  Created by Jaydeep Joshi on 18/12/24.
//

import SwiftUI

struct WorkoutsScreen: View {
    var body: some View {
        List {
            ForEach(Workout.workouts) { workout in
                workoutView(workout)
            }
        }
        .listStyle(.plain)
    }

    @ViewBuilder private func workoutView(_ workout: Workout) -> some View {
        Button {
            print(workout.id.uuidString)
        } label: {
            WorkoutRow(workout: workout)
                .contentShape(Rectangle())
        }
        .buttonStyle(.plain)
    }
}

#Preview {
    WorkoutsScreen()
}
