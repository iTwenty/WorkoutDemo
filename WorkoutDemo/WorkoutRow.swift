import SwiftUI

struct WorkoutRow: View {
    let workout: Workout
    @ScaledMetric(relativeTo: .largeTitle) var workoutLogoSize = 48
    @ScaledMetric var colorDotSize = 16

    var body: some View {
        HStack {
            Image(systemName: workout.typeImage)
                .font(.largeTitle)
                .foregroundStyle(.blue)
                .frame(width: workoutLogoSize, height: workoutLogoSize)
            VStack(alignment: .leading) {
                FittingStack(alignment: .leadingFirstTextBaseline) { axis in
                    Text(LocalizedStringKey(workout.type))
                        .lineLimit(1)
                    Spacer(minLength: axis == .horizontal ? 8 : 0)
                    Text(workout.startDate.formatted())
                        .font(.footnote)
                        .foregroundStyle(.secondary)
                }
                FittingStack(alignment: .center) { axis in
                    Text("\(workout.distanceKms?.formatted() ?? "--") kms")
                        .font(.title2.bold())
                        .foregroundStyle(.blue)
                    Spacer(minLength: axis == .horizontal ? 8 : 0)
                    Text(workout.startDate.formatted(date: .omitted, time: .shortened))
                        .font(.footnote)
                        .foregroundStyle(.secondary)
                }
                FittingStack(alignment: .leadingLastTextBaseline) { axis in
                    Text(workout.source)
                        .font(.caption)
                        .foregroundStyle(.secondary)
                    if let img = workout.deviceSystemImageName {
                        Spacer(minLength: axis == .horizontal ? 8 : 0)
                        Image(systemName: img)
                            .font(.callout)
                            .foregroundStyle(.blue)
                    }
                }
            }
        }
    }
}
